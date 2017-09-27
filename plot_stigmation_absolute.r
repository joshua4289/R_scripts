library(ggplot2)
library(ggthemes)

# data1 <- read.table('rlnDefocusU.dat')
# 
# ## Old way og Making Histogram problem setting xlim
# 
# hist(data1$V1,main="Defocus (in Angstoms)",
#      xlab = "Defous(A)",
#      ylab="Number of Images ",
#      col="blue",
#      
#      breaks=10
# )

#read in the Data
data1 <- read.table('rlnStigmation.dat')

#remove the negative values if any
data1[data1 < 0 ] <-NA
#remove weird outliers
data1[data1 > 1000] <- NA

print(sum(is.na(data1$V1)))


## Using ggplot2
min_of_data = min(data1,na.rm=TRUE)
max_of_data = max(data1,na.rm=TRUE) 
step_of_data=100

barfill <-"deepskyblue2"
barlines <-"black"


#temp1 = (min_of_data*step_of_data)/step_of_data
#temp2 = (max_of_data*step_of_data)/step_of_data
g1 = ggplot(data=data1,aes(x=data1$V1))+ geom_histogram(binwidth=10,fill=barfill,colour=barlines)+
  scale_x_continuous(name="Defocus (A)",breaks=seq(min_of_data,max_of_data,step_of_data),limits=c(0,1000))+
  
  scale_y_continuous(name="Number of Images")+
  theme_bw()+
  ggtitle("Defocus Values in the Dataset")+theme(plot.title = element_text(hjust = 0.5,face = 'bold',size=25))+
  theme(axis.text.x = element_text(size=12))+
  theme(axis.text.y = element_text(size=12))+
  theme(axis.title.x = element_text(size=14))+
  theme(axis.title.y = element_text(size = 14))
#font size of the axis numbers
g1





