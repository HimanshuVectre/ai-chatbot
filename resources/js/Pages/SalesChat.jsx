import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { useEffect, useRef, useState } from 'react';

export default function SalesChat({ conversations: initialConversations = [] }) {
    const [messages, setMessages] = useState([]);
    const [conversations, setConversations] = useState(initialConversations);
    const [currentConversationId, setCurrentConversationId] = useState(null);
    const [newMessage, setNewMessage] = useState('');
    const [loading, setLoading] = useState(false);
    const [stats, setStats] = useState({
        total_conversations: 0,
        total_messages: 0,
        avg_messages_per_conversation: 0,
    });
    const bottomRef = useRef(null);

    const CSRF_TOKEN = document.querySelector('[name=csrf-token]')?.content || '';

    // Auto-scroll to bottom
    useEffect(() => {
        bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
    }, [messages, loading]);

    // Fetch conversations on mount
    useEffect(() => {
        fetchConversationsList();
        fetchStats();
    }, []);

    // Load conversation when selected
    useEffect(() => {
        if (currentConversationId) {
            loadConversation(currentConversationId);
        }
    }, [currentConversationId]);

    const fetchConversationsList = async () => {
        try {
            const response = await fetch('/api/sales/conversations', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': CSRF_TOKEN,
                },
            });

            if (response.ok) {
                const data = await response.json();
                setConversations(data.conversations || []);
                // Auto-select first conversation
                if (data.conversations?.length > 0 && !currentConversationId) {
                    setCurrentConversationId(data.conversations[0].id);
                }
            }
        } catch (error) {
            console.error('Error fetching conversations:', error);
        }
    };

    const fetchStats = async () => {
        try {
            const response = await fetch('/api/sales/conversations/stats', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': CSRF_TOKEN,
                },
            });

            if (response.ok) {
                const data = await response.json();
                setStats(data.stats);
            }
        } catch (error) {
            console.error('Error fetching stats:', error);
        }
    };

    const loadConversation = async (conversationId) => {
        try {
            const response = await fetch(`/api/sales/conversation/${conversationId}/history`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': CSRF_TOKEN,
                },
            });

            if (response.ok) {
                const data = await response.json();
                setMessages(data.messages || []);
            } else {
                setMessages([]);
            }
        } catch (error) {
            console.error('Error loading conversation:', error);
            setMessages([]);
        }
    };

    const sendMessage = async (e) => {
        e.preventDefault();

        if (!newMessage.trim() || !currentConversationId) return;

        const userMessage = newMessage;
        setMessages((prev) => [
            ...prev,
            {
                role: 'user',
                content: userMessage,
                timestamp: new Date().toISOString(),
            },
        ]);

        setNewMessage('');
        setLoading(true);

        try {
            const response = await window.axios.post(route('invoke-agent'), {
                message: userMessage,
                conversation_id: currentConversationId,
            });

            if (response.data) {
                setMessages((prev) => [
                    ...prev,
                    {
                        role: 'assistant',
                        content: response.data.reply,
                        timestamp: new Date().toISOString(),
                    },
                ]);

                // Update conversation ID if it changed
                if (response.data.conversation_id) {
                    setCurrentConversationId(response.data.conversation_id);
                }

                // Refresh conversations list
                await fetchConversationsList();
                await fetchStats();
            }
        } catch (error) {
            console.error('Error sending message:', error);
            setMessages((prev) => [
                ...prev,
                {
                    role: 'error',
                    content: `Error: ${error.message}`,
                    timestamp: new Date().toISOString(),
                },
            ]);
        } finally {
            setLoading(false);
        }
    };

    const startNewConversation = () => {
        setCurrentConversationId(null);
        setMessages([]);
        setNewMessage('');
    };

    const deleteConversation = async (conversationId) => {
        if (!window.confirm('Are you sure you want to delete this conversation?')) {
            return;
        }

        try {
            const response = await fetch(`/api/sales/conversation/${conversationId}`, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': CSRF_TOKEN,
                },
            });

            if (response.ok) {
                await fetchConversationsList();
                await fetchStats();
                if (conversationId === currentConversationId) {
                    startNewConversation();
                }
            }
        } catch (error) {
            console.error('Error deleting conversation:', error);
        }
    };

    const exportConversation = async (conversationId) => {
        try {
            const response = await fetch(`/api/sales/conversation/${conversationId}/export`, {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-TOKEN': CSRF_TOKEN,
                },
            });

            if (response.ok) {
                const data = await response.json();
                const jsonString = JSON.stringify(data.export, null, 2);
                const blob = new Blob([jsonString], { type: 'application/json' });
                const url = URL.createObjectURL(blob);
                const link = document.createElement('a');
                link.href = url;
                link.download = `conversation-${conversationId.slice(0, 8)}.json`;
                link.click();
                URL.revokeObjectURL(url);
            }
        } catch (error) {
            console.error('Error exporting conversation:', error);
        }
    };

    const formatDate = (date) => {
        if (!date) return '';
        return new Date(date).toLocaleDateString('en-US', {
            month: 'short',
            day: 'numeric',
            year: 'numeric',
        });
    };

    const formatTime = (date) => {
        if (!date) return '';
        return new Date(date).toLocaleTimeString('en-US', {
            hour: '2-digit',
            minute: '2-digit',
        });
    };

    return (
        <AuthenticatedLayout
            header={
                <div className="flex items-center justify-between gap-4">
                    <h2 className="text-xl font-semibold leading-tight text-gray-800">
                        Sales Assistant - Conversation Manager
                    </h2>
                </div>
            }
        >
            <Head title="Sales Chat" />

            <div className="py-12">
                <div className="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
                    <div className="grid grid-cols-1 gap-6 lg:grid-cols-4">
                        {/* Sidebar */}
                        <div className="lg:col-span-1">
                            <div className="overflow-hidden rounded-lg bg-white shadow-sm">
                                <div className="p-6">
                                    {/* Header */}
                                    <div className="mb-4 flex items-center justify-between">
                                        <h3 className="text-lg font-semibold text-gray-900">
                                            Conversations
                                        </h3>
                                        <button
                                            onClick={startNewConversation}
                                            className="rounded bg-blue-600 px-3 py-1 text-sm text-white hover:bg-blue-700"
                                        >
                                            New
                                        </button>
                                    </div>

                                    {/* Stats */}
                                    <div className="mb-4 rounded bg-gray-100 p-3">
                                        <p className="text-sm text-gray-600">
                                            Total:{' '}
                                            <span className="font-bold">
                                                {stats.total_conversations}
                                            </span>
                                        </p>
                                        <p className="text-sm text-gray-600">
                                            Messages:{' '}
                                            <span className="font-bold">
                                                {stats.total_messages}
                                            </span>
                                        </p>
                                    </div>

                                    {/* Conversations List */}
                                    <div className="max-h-96 space-y-2 overflow-y-auto">
                                        {conversations.length === 0 ? (
                                            <div className="py-4 text-center text-sm text-gray-500">
                                                No conversations yet
                                            </div>
                                        ) : (
                                            conversations.map((conv) => (
                                                <div
                                                    key={conv.id}
                                                    onClick={() =>
                                                        setCurrentConversationId(conv.id)
                                                    }
                                                    className={`cursor-pointer rounded p-3 transition ${
                                                        currentConversationId === conv.id
                                                            ? 'bg-blue-500 text-white'
                                                            : 'bg-gray-50 text-gray-800 hover:bg-gray-100'
                                                    }`}
                                                >
                                                    <div className="truncate font-medium">
                                                        {formatDate(conv.created_at)}
                                                    </div>
                                                    <div
                                                        className={`text-xs ${
                                                            currentConversationId === conv.id
                                                                ? 'text-blue-100'
                                                                : 'text-gray-500'
                                                        }`}
                                                    >
                                                        {formatTime(conv.last_interaction)}
                                                    </div>
                                                </div>
                                            ))
                                        )}
                                    </div>

                                    {/* Actions */}
                                    <div className="mt-4 border-t pt-4 space-y-2">
                                        <button
                                            onClick={() =>
                                                currentConversationId &&
                                                exportConversation(currentConversationId)
                                            }
                                            disabled={!currentConversationId}
                                            className="w-full rounded bg-green-600 px-3 py-2 text-sm text-white hover:bg-green-700 disabled:bg-gray-300"
                                        >
                                            Export
                                        </button>
                                        <button
                                            onClick={() =>
                                                currentConversationId &&
                                                deleteConversation(currentConversationId)
                                            }
                                            disabled={!currentConversationId}
                                            className="w-full rounded bg-red-600 px-3 py-2 text-sm text-white hover:bg-red-700 disabled:bg-gray-300"
                                        >
                                            Delete
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {/* Chat Area */}
                        <div className="flex h-96 flex-col overflow-hidden rounded-lg bg-white shadow-sm lg:col-span-3">
                            {/* Messages */}
                            <div className="flex-1 overflow-y-auto bg-gray-50 p-6">
                                {messages.length === 0 ? (
                                    <div className="flex h-full items-center justify-center">
                                        <div className="text-center text-gray-500">
                                            <p className="mb-2 text-lg font-semibold">
                                                Select a conversation or start a new one
                                            </p>
                                            <p className="text-sm">
                                                Your conversation history will appear here
                                            </p>
                                        </div>
                                    </div>
                                ) : (
                                    <>
                                        {messages.map((message, index) => (
                                            <div
                                                key={index}
                                                className={`mb-4 flex gap-2 ${
                                                    message.role === 'user'
                                                        ? 'justify-end'
                                                        : 'justify-start'
                                                }`}
                                            >
                                                <div
                                                    className={`max-w-xl rounded-lg px-4 py-2 ${
                                                        message.role === 'user'
                                                            ? 'rounded-br-none bg-blue-600 text-white'
                                                            : 'rounded-bl-none bg-gray-200 text-gray-900'
                                                    }`}
                                                >
                                                    <p className="text-sm">
                                                        {message.content}
                                                    </p>
                                                    <p
                                                        className={`mt-1 text-xs ${
                                                            message.role === 'user'
                                                                ? 'text-blue-200'
                                                                : 'text-gray-500'
                                                        }`}
                                                    >
                                                        {formatTime(message.timestamp)}
                                                    </p>
                                                </div>
                                            </div>
                                        ))}

                                        {loading && (
                                            <div className="mb-4 flex gap-2">
                                                <div className="flex items-center gap-2">
                                                    <div className="h-2 w-2 animate-bounce rounded-full bg-gray-400"></div>
                                                    <div
                                                        className="h-2 w-2 animate-bounce rounded-full bg-gray-400"
                                                        style={{
                                                            animationDelay: '0.2s',
                                                        }}
                                                    ></div>
                                                    <div
                                                        className="h-2 w-2 animate-bounce rounded-full bg-gray-400"
                                                        style={{
                                                            animationDelay: '0.4s',
                                                        }}
                                                    ></div>
                                                </div>
                                            </div>
                                        )}

                                        <div ref={bottomRef} />
                                    </>
                                )}
                            </div>

                            {/* Input */}
                            <div className="border-t bg-white p-4">
                                <form onSubmit={sendMessage} className="flex gap-2">
                                    <input
                                        type="text"
                                        value={newMessage}
                                        onChange={(e) => setNewMessage(e.target.value)}
                                        placeholder="Ask about products, orders, or services..."
                                        disabled={loading || !currentConversationId}
                                        className="flex-1 rounded-lg border border-gray-300 px-4 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-blue-500 disabled:bg-gray-100"
                                    />
                                    <button
                                        type="submit"
                                        disabled={
                                            loading ||
                                            !newMessage.trim() ||
                                            !currentConversationId
                                        }
                                        className="rounded-lg bg-blue-600 px-6 py-2 text-sm font-medium text-white hover:bg-blue-700 disabled:bg-gray-300"
                                    >
                                        Send
                                    </button>
                                </form>
                                {!currentConversationId && (
                                    <p className="mt-2 text-xs text-gray-500">
                                        Select or create a conversation to start messaging
                                    </p>
                                )}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
