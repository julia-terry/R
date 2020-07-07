#Reading & Working with Data


#Question: What is the distribution of gene lengths in the model oil seed plant Camelina sativa?

#Download the Camelina gene model annotations file onto your computer
root="http://igbquickload.org/quickload/C_sativa_DH55_Apr_2014"
file_name = "C_sativa_DH55_Apr_2014.bed.gz"
URL=paste(root,file_name,sep="/")
download.file(url=URL,destfile=file_name)

#Read the gene model file into R
data = read.delim("C_sativa_DH55_Apr_2014.bed.gz",as.is=T,sep="\t", header=FALSE,quote="")

#Create a new data frame genes using subsetting and assign column names
genes = data[,c(1,2,3,4,6,10,13,14)]
column_names=c("chr","start","end","id","strand","num_exons","locus","description")
names(genes)=column_names

#The length of each gene model is the end minus the start columns. Add a new column "length" with these numbers
genes$length=genes$end-genes$start

#Use the hist command to view the distribution of gene model lengths
hist(genes$length)


#EXERCISES
#Copy/paste into console for the output

#Find genes longer than 30,000 bases and smaller than 10,000 bases
sum(genes$length<10000)
sum(genes$length>30000)

#Find the smallest and largest gene models' id, locus, and description
smallest_index = which(genes$length==min(genes$length))
genes[smallest_index,c("id","locus","description")]

longest_index = which(genes$length==max(genes$length))
genes[longest_index,c("id","locus","description")]

#Sort the data frame by it's length columns
#Note: the order command returns a numeric vector that contains indices of rows. So you need to use this to change your data frame
o = order(genes$length, decreasing = TRUE)
genes = genes[o, ]

#Find the amount of genes whose descriptions contain the word "seed"
#Note: the grep command lets you search text columns for keywords or other patterns. It returns the indexes of rows that contain the given text
seed_indexes=grep("seed", genes$description)
length(seed_indexes)



