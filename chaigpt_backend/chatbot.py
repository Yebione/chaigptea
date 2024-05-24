import pandas as pd
import os, shutil, datetime, random

import nltk
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords

# Download necessary NLTK data
nltk.download('punkt')
nltk.download('wordnet')
nltk.download('stopwords')


nomatch = "Sorry, I cannot help with that"
thankyou = "chai thank you^^"
logfile = 'chat.log'


# Load dataset
data = pd.read_csv('data.csv', delimiter=';')
# Initialize lemmatizer and stop words
lemmatizer = WordNetLemmatizer()
stop_words = set(stopwords.words('english'))
# Preprocess text
def preprocess_text(text):
    tokens = nltk.word_tokenize(text.lower())
    tokens = [lemmatizer.lemmatize(word) for word in tokens if word.isalnum() and word not in stop_words]
    return ' '.join(tokens)
# Initialize a TF-IDF Vectorizer for similarity computation
tfidf_vectorizer = TfidfVectorizer()
tfidf_vectorizer.fit(pd.concat([data['question'], data['answer']]))



def get_response(user_input, similarity_threshold=0.2):
    if (user_input == "bye"):
        response = thankyou
    else:
        processed_input = preprocess_text(user_input)
    
        # Transform the user input and candidate responses
        user_input_tfidf = tfidf_vectorizer.transform([processed_input])
        candidate_questions_tfidf = tfidf_vectorizer.transform(data['question'])
        
        # Compute cosine similarity
        similarities = cosine_similarity(user_input_tfidf, candidate_questions_tfidf)
        
        # Find the indices of questions with similarity above threshold
        similar_indices = [i for i, sim in enumerate(similarities[0]) if sim > similarity_threshold]
        
        if similar_indices:
            # Select the response with the highest similarity
            max_similarity_index = max(similar_indices, key=lambda x: similarities[0][x])
            response = data['answer'].iloc[max_similarity_index]
        else:
            response = nomatch
            
            
    line = '[{}] {}: {}\n'.format(datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S'), user_input, response)
    with open(logfile, "a+") as m:
        m.write(line)
    return response



