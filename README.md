PredictionIO-Jokes-demo
=======================

Tech demo of using PredictionIO, R and the Jester Collaborative Filtering dataset.

Note: this is a tech demo and no extensive tutorial. Some basic knowledge of PredictionIO and R are necessary.

Dependencies
============

This tech demo depends on a running instance of PredictionIO v0.7.3. Furthermore, the following R libraries are being used:

- httr
- jsonlite
- stringr

Usage
=====

- Make sure PredictionIO is running (bin/start-all.sh)
- Create an app, save the app key.
- In the created app, add an Item Recommendation Engine and save the name of the engine.
- In predictionio.R, update the following variables: appkey, url, itemrecEngine.
- In R, set your current working directory to the location of this repository
- Make sure the file 'jester-data-1.csv' is in your current working directory
- Open and source import.R, this starts the import process
- When the data has been imported, start the training process of the alogithm of the Item Recommendation Engine in PredictionIO.
- When the training process has been completed, open demo.R to see how to get recommended items from PredictionIO.

Example demo output
===================

```
\# Get the top 5 recommendations for user 2
top5rec <- getTopNRecommendation(2, 5)
\# [1] 77 76 67 43 34

jokes[77]
\#                                                                           Joke 77 
\# "If pro- is the opposite of con- then congress must be the opposite of progress." 
```
