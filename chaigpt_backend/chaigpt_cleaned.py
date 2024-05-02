import nltk
import re
import os 
import csv
from nltk.stem.snowball import SnowballStemmer
import random 
from nltk.classify import SklearnClassifier 
from nltk.tokenize import RegexpTokenizer 
from nltk.corpus import stopwords
from nltk.stem.wordnet import WordNetLemmatizer
import numpy as np
import pandas as pd



##Get multiple outputs in the same shell
from IPython.core.interactiveshell import InteractiveShell
InteractiveShell.ast_node_interactivity = all


##Ignore all warnings
import warnings 
warnings.filterwarnings('ignore')
warnings.filterwarnings(action='ignore', category=DeprecationWarning)


##Display all rows and columns of a dataframe instead of a tuncated version
from IPython.display import display
pd.set_option('display.max_columns', None)
pd.set_option('display.max_rows', None)




def preprocess(sentence):
    sentence = sentence.lower()
    tokenizer = RegexpTokenizer(r'\w+')
    tokens = tokenizer.tokenize(sentence)
    filtered_words = [w for w in tokens if not w in stopwords.words('english')]
    return filtered_words
    
preprocessed_sentence = preprocess(sentence)


tags = nltk.pos_tag(preprocessed_sentence)

def extract_tagged(sentences):
    features = []
    for tagged_word in sentences:
        word, tag = tagged_word
        if tag == 'NN' or tag == 'VBN' or tag == 'NNS' or tag == 'VBP' or tag == 'RB' or tag == 'VBZ' or tag == 'VBG' or tag == 'PRP' or tag == 'JJ':
            features.append(word)
            
    return features

lmtzr = WordNetLemmatizer()
stemmer = SnowballStemmer("english")


def extract_feature(text):
    words = preprocess(text)
    
    tags = nltk.pos_tag(words)
    
    extracted_features = extract_tagged(tags)
    
    stemmed_words = [stemmer.stem(x) for x in extracted_features]
    
    result = [lmtzr.lemmatize(x) for x in stemmed_words]
    
    return result




def word_feats(words):
    return dict([(word, True) for word in words])

##parsing the whole document 
def extract_feature_from_doc(data):
    result = []
    corpus  = []
    
    answers = {}
    for (text,category, answer) in data:
        features = extract_feature(text)
        
        corpus.append(features)
        result.append((word_feats(features), category))
        answers[category] = answer
        
    return (result, sum(corpus,[]), answers)


def get_content(filename):
    doc = os.path.join(filename)
    with open(doc, 'r') as content_file:
        lines = csv.reader(content_file, delimiter = '|')
        data = [x for x in lines if len(x) == 3]
        return data
    
filename = "chaigpt.txt"
data = get_content(filename)    
  
     
features_data, corpus, answers = extract_feature_from_doc(data)

split_ratio = 0.8

def split_database(data, split_ratio):
    random.shuffle(data)
    data_length = len(data)
    train_split = int(data_length * split_ratio)
    return (data[:train_split]), (data[train_split:])

training_data, test_data = split_database(features_data, split_ratio)


training_data = np.load('training_data.npy', allow_pickle= True)
test_data = np.load('test_data.npy', allow_pickle= True)


def train_using_decision_tree(training_data, test_data):
    classifier = nltk.classify.DecisionTreeClassifier.train(training_data, entropy_cutoff=0.6, support_cutoff= 6)
    classifier_name = type(classifier).__name__
    training_set_accuracy = nltk.classify.accuracy(classifier, training_data)
    print('training set accuracy: ', training_set_accuracy)
    test_set_accuracy = nltk.classify.accuracy(classifier, test_data)
    print('test set accuracy: ', test_set_accuracy)
    return classifier, classifier_name, test_set_accuracy, training_set_accuracy


