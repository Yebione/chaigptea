from flask import Flask, request, jsonify
import pandas as pd
import chatbot
from difflib import SequenceMatcher

app = Flask(__name__)

welcome = "Hi! I'm chaigptea. How can I help you?"
nomatch = "Sorry, I cannot help with that"
qafile = "chaigpt.csv"
thankyou = "Thank you^^"
exitmessage = "Please type 'bye' to exit the chat."

bot = chatbot.Chatbot(nomatch, qafile, thankyou)
bot.run_bot()

@app.route("/api/chatbot", methods=['POST'])
def get_bot_response():
    user_text = request.json.get('message')

    if user_text:
        response = bot.get_response(user_text)
        return jsonify({"response": response})
    else:
        return jsonify({"error": "No message provided."}), 400

if __name__ == "__main__":
    app.run()
