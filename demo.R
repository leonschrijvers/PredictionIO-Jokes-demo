source("predictionio.R")
source("readjoketexts.R")

# Get the top 5 recommendations for user 2
top5rec <- getTopNRecommendation(2, 5)
# [1] 77 76 67 43 34

