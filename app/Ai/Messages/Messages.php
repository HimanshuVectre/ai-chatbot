<?php

use App\Models\History;
use Laravel\Ai\Messages\Message;

class Messages
{
    public function __construct(public User $user) {}

    /**
     * Get the list of messages comprising the conversation so far.
     */
    public function messages(): iterable
    {
        return History::where('user_id', $this->user->id)
            ->latest()
            ->limit(5)
            ->get()
            ->reverse()
            ->map(function ($message) {
                return new Message($message->role, $message->content);
            })->all();
    }

}
