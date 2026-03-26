import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { useEffect, useRef, useState } from 'react';

export default function Chatbot() {
    const [messages, setMessages] = useState([
        {
            id: 'welcome',
            role: 'assistant',
            content:
                'Hi, I am your sales assistant. Ask about products, categories, or your orders.',
        },
    ]);
    const [input, setInput] = useState('');
    const [conversationId, setConversationId] = useState(null);
    const [isLoading, setIsLoading] = useState(false);
    const [error, setError] = useState('');
    const bottomRef = useRef(null);

    useEffect(() => {
        bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
    }, [messages, isLoading]);

    const submitMessage = async (event) => {
        event.preventDefault();

        const message = input.trim();
        if (!message || isLoading) {
            return;
        }

        const userMessageId = `user-${Date.now()}`;
        const userMessage = {
            id: userMessageId,
            role: 'user',
            content: message,
        };

        setMessages((previous) => [...previous, userMessage]);
        setInput('');
        setError('');
        setIsLoading(true);

        try {
            const response = await window.axios.post(route('invoke-agent'), {
                message,
                conversation_id: conversationId,
            });

            setConversationId(response.data.conversation_id ?? conversationId);
            const isWarning = Boolean(response.data.warning);

            setMessages((previous) => [
                ...previous.map((item) =>
                    isWarning && item.id === userMessageId
                        ? { ...item, isWarning: true }
                        : item,
                ),
                {
                    id: `assistant-${Date.now()}`,
                    role: 'assistant',
                    content: response.data.reply ?? 'No response received.',
                    isWarning,
                },
            ]);
        } catch (requestError) {
            const fallback = 'Unable to reach the AI agent right now.';
            const backendMessage = requestError?.response?.data?.message;
            setError(backendMessage || fallback);
        } finally {
            setIsLoading(false);
        }
    };

    const startNewChat = () => {
        setConversationId(null);
        setError('');
        setMessages([
            {
                id: `assistant-${Date.now()}`,
                role: 'assistant',
                content:
                    'Started a new chat. Ask about products, categories, or your orders.',
            },
        ]);
    };

    return (
        <AuthenticatedLayout
            header={
                <div className="flex items-center justify-between gap-4">
                    <h2 className="text-xl font-semibold leading-tight text-gray-800">
                        AI Chatbot
                    </h2>
                    <button
                        type="button"
                        onClick={startNewChat}
                        className="rounded-md border border-gray-300 bg-white px-3 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50"
                    >
                        New Chat
                    </button>
                </div>
            }
        >
            <Head title="Chatbot" />

            <div className="py-8">
                <div className="mx-auto max-w-4xl px-4 sm:px-6 lg:px-8">
                    <div className="flex h-[70vh] flex-col overflow-hidden rounded-lg border border-gray-200 bg-white shadow-sm">
                        <div className="flex-1 space-y-4 overflow-y-auto bg-gray-50 p-4">
                            {messages.map((message) => (
                                <div
                                    key={message.id}
                                    className={`flex ${
                                        message.role === 'user'
                                            ? 'justify-end'
                                            : 'justify-start'
                                    }`}
                                >
                                    <div
                                        className={`max-w-[85%] rounded-2xl px-4 py-3 text-sm leading-6 ${
                                            message.isWarning
                                                ? message.role === 'user'
                                                    ? 'bg-red-600 text-white'
                                                    : 'bg-red-50 text-red-700 shadow-sm ring-1 ring-red-200'
                                                : message.role === 'user'
                                                  ? 'bg-gray-900 text-white'
                                                  : 'bg-white text-gray-900 shadow-sm ring-1 ring-gray-200'
                                        }`}
                                    >
                                        {message.content}
                                    </div>
                                </div>
                            ))}

                            {isLoading && (
                                <div className="flex justify-start">
                                    <div className="max-w-[85%] rounded-2xl bg-white px-4 py-3 text-sm text-gray-500 shadow-sm ring-1 ring-gray-200">
                                        Thinking...
                                    </div>
                                </div>
                            )}

                            <div ref={bottomRef} />
                        </div>

                        <div className="border-t border-gray-200 bg-white p-4">
                            {error ? (
                                <div className="mb-3 rounded-md bg-red-50 px-3 py-2 text-sm text-red-700">
                                    {error}
                                </div>
                            ) : null}

                            <form onSubmit={submitMessage} className="flex gap-3">
                                <input
                                    type="text"
                                    value={input}
                                    onChange={(event) =>
                                        setInput(event.target.value)
                                    }
                                    placeholder="Ask about products, categories, or your orders..."
                                    className="flex-1 rounded-md border-gray-300 text-sm shadow-sm focus:border-gray-500 focus:ring-gray-500"
                                    disabled={isLoading}
                                />
                                <button
                                    type="submit"
                                    disabled={isLoading || !input.trim()}
                                    className="rounded-md bg-gray-900 px-5 py-2 text-sm font-semibold text-white hover:bg-black disabled:cursor-not-allowed disabled:opacity-50"
                                >
                                    Send
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
