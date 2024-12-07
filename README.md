SENTIMENT ANALYSIS OF UGANDAN TWEETS USING SCHEME AND DR RACKET (SICP)
========================================================================================

#OVERVIEW
This project implements sentiment analysis for tweets geolocated in Uganda using Racket.
The analysis is based on the data-science package for Racket and performs
    1. Preprocessing
    2. Sentiment classification.
    3. Visualization.
The project is designed for the MCN 7105: Structure and Interpretation of Computer Programs course

#DATASET USED
The project processes a dataset of Ugandan tweets (`ug_tweets.csv`) and uses predefined sentiment lexicons (`nrc` and `bing`) to classify the sentiments.
For Visualizations, histograms were used  to provide insights into the distribution of emotions and sentiment polarity.

# FEATURES
a) Tweet Data Preprocessing
   - Reads and filters tweet data from a CSV file.
   - Removes retweets (`RT`) and normalizes text by removing punctuation and spaces.
   - Tokenizes tweet content into individual words.

b) Sentiment Analysis
   - Uses `nrc` and `bing` sentiment lexicons to classify emotions and sentiment polarity.
   - Aggregates sentiment frequencies for detailed analysis.

3. Visualization
   - Generates histograms and bar charts for
     (i) Emotion distribution (e.g., joy, sadness, anger).
     (ii) Positive vs. negative sentiment polarity.


#DEPENDENCIES USED
The following tools and libraries are required:
1. Racket Version 8.0 or higher was downloaded from ([Download Racket](https://racket-lang.org)).
2. Racket Data Science Package was downloaded from [n3mo/data-science](https://github.com/n3mo/data-science)
3. Racket Packages
   (i) net/url
   (ii) plot
   (iii) math
   (iv) json
   (v) CSV reading support from `data-science-master

## PROJECT STRUCTURE

sentiment-analysis/
├── ug_tweets.csv          # Dataset of Ugandan tweets
├── balex_ug_tweets_analysis.rkt  # Main Racket file for analysis
├── README.md               # Project documentation
├── visualizations/         # Output graphs

