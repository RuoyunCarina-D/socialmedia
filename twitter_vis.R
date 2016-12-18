twitter<- scan("/Users/RuoyunDeng/Documents/Master/social_media/twitter_text.txt", what="character", sep="\n")
twitter_np <- gsub( "[^[:alnum:]@]", " ", twitter)
myCorpus <- Corpus(VectorSource(twitter_np))
myTdm <- TermDocumentMatrix(myCorpus)
temp <- inspect(myTdm)
FreqMat <- data.frame(ST = rownames(temp), Freq = rowSums(temp))
row.names(FreqMat) <- NULL
FreqMat_np <- FreqMat
FreqMat



wordcloud2(data=FreqMat, minSize = 8)
#delet the most frequency two "the" and "gwu"


n_the <- grep(382, FreqMat$Freq) #the
n_gwu <- grep(788, FreqMat$Freq)
n_amp <- grep(213, FreqMat$Freq)
n_for <- grep(225, FreqMat$Freq)
n_https <- grep(715, FreqMat$Freq)
n_and <- grep(125, FreqMat$Freq)

FreqMat_np <- FreqMat[-c(n_the, n_gwu,n_amp,n_for,n_https,n_and),]
wordcloud2(data=FreqMat_np)

#@
n_at <- grep("@", FreqMat_np$ST)
name_list <- FreqMat_np[n_at,]
FreqMat_np_nn <- FreqMat_np[-n_at,]

wordcloud2(data=FreqMat_np_nn)

sort_Fre <- sort(FreqMat_np_nn, decreasing = T )


