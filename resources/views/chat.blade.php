<!DOCTYPE html>
<html>
<head>
    <title>Gemini Chatbot</title>
</head>
<body>
    <h1>Gemini Chatbot</h1>
    <form id="chatForm">
        <input type="text" id="message" placeholder="Type your message" required>
        <button type="submit">Send</button>
    </form>
    <div id="response"></div>

    <script>
        const form = document.getElementById('chatForm');
        form.addEventListener('submit', async (e) => {
            e.preventDefault();
            const message = document.getElementById('message').value;
            const responseDiv = document.getElementById('response');
            responseDiv.innerText = 'Thinking...';

            try {
                const res = await fetch('/chat', {
                    method: 'POST',
                    headers: { 
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: JSON.stringify({ message })
                });
                const data = await res.json();
                
                if (data.reply) {
                    responseDiv.innerHTML = `<strong>(${data.provider}):</strong> ${data.reply}`;
                } else if (data.error) {
                    responseDiv.innerText = 'Error: ' + data.error;
                } else {
                    responseDiv.innerText = 'Unexpected response format: ' + JSON.stringify(data);
                }
            } catch (err) {
                responseDiv.innerText = 'Error: ' + err.message;
            }
        });
    </script>
</body>
</html>