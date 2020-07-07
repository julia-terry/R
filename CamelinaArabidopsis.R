
# Introduction ------------------------------------------------------------

#Camelina sativa is a model oilseed crop plant from the Brassica family. Arabidopsis thaliana is also in the Brassica family, but is smaller than Camelina, has a shorter generation time, and a smaller genome.
#We are examining two questions: what is the distribution of gene lengths between the two and which one is larger?
#I expect that since the Arabidopsis has a smaller genome, it will also have smaller gene lengths but, due to their relation, the differences will not be drastic.
#I will be using the data from igbquickload.org for both arabidopsis.gz and camelina.gz


# Results -----------------------------------------------------------------

#I put the chromStart and chromEnds of Camelina sativa and Arabidopsis thaliana into their own matricies. I then calculated their lengths into a new row.

#```{r}
camelina_url="http://igbquickload.org/quickload/C_sativa_DH55_Apr_2014/C_sativa_DH55_Apr_2014.bed.gz"
arabidopsis_url="http://igbquickload.org/quickload/A_thaliana_Jun_2009/TAIR10_mRNA.bed.gz"
arabidopsis_fname="arabidopsis.gz"
download.file(arabidopsis_url,arabidopsis_fname)
arabidopsis_dataframe=read.delim2(arabidopsis_fname,header=FALSE,sep="\t",quote="")
camelina_fname="camelina.gz"
download.file(camelina_url,camelina_fname)
camelina_dataframe=read.delim2(camelina_fname,header=FALSE,sep="\t",quote="")
camelinaLengths = camelina_dataframe[,c("V2","V3")]
arabidopsisLengths = arabidopsis_dataframe[,c("V2","V3")]
camelinaLengths$difference<-(camelinaLengths$V3-camelinaLengths$V2)
arabidopsisLengths$difference<-(arabidopsisLengths$V3-arabidopsisLengths$V2)
#```

#The different matricies showed that Camelina has a bigger max value at 40601 versus 31258, a difference of 9343.
#It also showed that Camelina has a bigger min value at 117 versus 22, a difference of 95. 
#All of this concluding to the idea that Camelina lengths may be longer.

#```{r}
arabidopsisMax = max(arabidopsisLengths$difference)
arabidopsisMin = min(arabidopsisLengths$difference)
camelinaMax = max(camelinaLengths$difference)
camelinaMin = min(camelinaLengths$difference)
#```

#I plotted both lengths next to each other to compare. The conclusion from the graphs was that, although they do have similarities with the majority of them being at/below 10000, Camelina's data was higher.

#```{r}
par(mfrow=c(1,3))
boxplot(camelinaLengths$difference)
plot(arabidopsisLengths$difference, main = "Arabidopsis", col="green", pch=16, ylab="Lengths")
plot(camelinaLengths$difference, main = "Camelina", col="blue", ylab= "Lengths")
#```

# Conclusion --------------------------------------------------------------

#Although in the same family, Arabidopsis and Camelina's gene lengths differ enough to note a difference. Camelina's lengths were overall larger than Arabidopsis.

