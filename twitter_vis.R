library(wordcould2)
library(tm)

#import twitter text file and transfer, then calculate the frequency of each word
twitter<- scan("twitter_text.txt", what="character", sep="\n")
twitter_np <- gsub( "[^[:alnum:]@]", " ", twitter)
myCorpus <- Corpus(VectorSource(twitter_np))

myTdm <- TermDocumentMatrix(myCorpus)
temp <- inspect(myTdm)
FreqMat <- data.frame(ST = rownames(temp), Freq = rowSums(temp))
row.names(FreqMat) <- NULL
FreqMat_np <- FreqMat
FreqMat

#use wordcloud2 to do a initially visualization 
wordcloud2(data=FreqMat, minSize = 8)

#seperate users involving in those tweets
n_at <- grep("@", FreqMat_np$ST)
name_list <- FreqMat_np[n_at,]
FreqMat_np_nn <- FreqMat_np[-n_at,]

#delet the most frequency but meaningless words such as "the"
n_the <- grep(382, FreqMat$Freq) #the
n_gwu <- grep(788, FreqMat$Freq)
n_amp <- grep(213, FreqMat$Freq)
n_for <- grep(225, FreqMat$Freq)
n_https <- grep(715, FreqMat$Freq)
n_and <- grep(125, FreqMat$Freq)

FreqMat_np <- FreqMat[-c(n_the, n_gwu,n_amp,n_for,n_https,n_and),]
wordcloud2(data=FreqMat_np)

#final pic
wordcloud2(data=FreqMat_np_nn)

