from flask import Flask, request, jsonify
import pandas as pd
import chatbot
from difflib import SequenceMatcher

app = Flask(__name__)


@app.route("/api/chatbot", methods=['POST'])
def get_bot_response():
    user_input = request.json.get('message')

    if user_input:
        response = chatbot.get_response(user_input)
        return jsonify({"response": response})
    else:
        return jsonify({"error": "No message provided."}), 400

if __name__ == "__main__":
    app.run()
