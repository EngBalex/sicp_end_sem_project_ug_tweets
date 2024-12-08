#|
 NAME: BAZIGU ALEX
 REG NO: 2400722080
 STUDENT NO: 2024/HD05/22080U
 COURSE: MASTERS OF SCIENCE IN DATA COMMUNICATION AND SOFTWARE ENGINEERING
 COURSE CODE: MDCSE - SOFTWARE ENGINEERING (OPTION)
 COURSE UNIT: STRUCTURE INTERPRETATION OF COMPUTER PROGRAMS
|#


#lang racket
(require net/url)
(require data-science-master)
(require plot)
(require math)
(require json)

#|
  Abstraction 1: Laoding and Pre-processing using the read-csv
 Here we need to Load and preprocess the dataset
|#

(define data (read-csv "ug_tweets.csv" #:->number? #f #:header? #t))

(define sample_data
  (let ([tmp (map (λ (x) (list (list-ref x 9))) data)])
    (filter (λ (x) (not (string-prefix? (first x) "RT"))) tmp)))
(define f_sample_data (flatten sample_data))

#|
  Here we take the f_sample_data 5
|#

(define all_tweet-text (apply string-append f_sample_data))


#|
   Let Us Show "all_tweet-text"
   all_tweet-text
   for-each (lambda (x) (newline) (display x))
          sample_data)

|#
(define p_tweet-text (string-normalize-spaces
                      (remove-punctuation
                       (string-downcase all_tweet-text) #:websafe? #t)))
#|

    Show the "p_tweet-text"
      using the
        p_tweet-text
|#

(define words (document->tokens p_tweet-text #:sort? #t))


#|
  Abstraction 2: Sentiment Analysis
  Here we also display "words"
       Using the 
              words
|#

(define sentiment (list->sentiment words #:lexicon 'nrc))

#|
  Show the "sentiment"
      sentiment
 |#

(aggregate sum ($ sentiment 'sentiment) ($ sentiment 'freq))

(let ([counts (aggregate sum ($ sentiment 'sentiment) ($ sentiment 'freq))])
  (parameterize ((plot-width 1200))
    (plot (list
	   (tick-grid)
	   (discrete-histogram
	    (sort counts (λ (x y) (> (second x) (second y))))
	    #:color "orange"
	    #:line-color "violet"))
	  #:x-label "Sentigroup Group"
	  #:y-label "Frequency")))

(define sentiment_bing (list->sentiment words #:lexicon 'bing))
(parameterize ([plot-height 320])
  (plot (discrete-histogram
	 (aggregate sum ($ sentiment_bing 'sentiment) ($ sentiment_bing 'freq))
	 #:y-min 0
	 #:y-max 600
	 #:invert? #t
	 #:color "green"
	 #:line-color "blue")
	#:x-label "Frequency"
	#:y-label "Sentiment Polarity"))


#|

Aggregate sentiment counts

|#
(define sentiment_counts
  (aggregate sum
             ($ sentiment 'sentiment) ;; Affective label (e.g., "positive", "negative")
             ($ sentiment 'freq)))    ;; Frequency of each label


(parameterize ((plot-width 1000))
  (plot (list
         (tick-grid)
         (function
          (λ (x)
            (let ([idx (floor x)])
              (if (and (>= idx 0) (< idx (length sentiment_counts)))
                  (second (list-ref sentiment_counts idx)) ;; Access frequency
                  0)))
          0 (length sentiment_counts) #:color "red"))
        #:x-label "Sentiment Type"
        #:y-label "Frequency"
        #:title "Sentiment Bar Chart"))


