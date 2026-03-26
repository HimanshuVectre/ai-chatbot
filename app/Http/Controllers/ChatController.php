<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class ChatController extends Controller
{
    public function sendMessage(Request $request)
    {
        $message = $request->input('message');

        try {
            // 1. Try OpenAI first
            $openaiResponse = Http::withToken(env('OPENAI_API_KEY'))
                ->post('https://api.openai.com/v1/chat/completions', [
                    'model' => env('OPENAI_MODEL', 'gpt-4o-mini'),
                    'messages' => [
                        ['role' => 'user', 'content' => $message],
                    ],
                ]);

            if ($openaiResponse->successful()) {
                $data = $openaiResponse->json();
                return response()->json([
                    'reply' => $data['choices'][0]['message']['content'],
                    'provider' => 'openai'
                ]);
            }

            // 2. If OpenAI fails, fallback to Gemini
            $geminiResponse = Http::post('https://generativelanguage.googleapis.com/v1beta/models/' . env('GEMINI_MODEL') . ':generateContent?key=' . env('GEMINI_API_KEY'), [
                'contents' => [['parts' => [['text' => $message]]]]
            ]);

            if ($geminiResponse->successful()) {
                $data = $geminiResponse->json();
                return response()->json([
                    'reply' => $data['candidates'][0]['content']['parts'][0]['text'],
                    'provider' => 'gemini'
                ]);
            }

            return response()->json(['error' => 'All AI providers failed.'], 500);

        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
