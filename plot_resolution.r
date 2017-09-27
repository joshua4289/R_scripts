library(ggplot2)
library(ggthemes)

data1 <- read.table('rlnres.dat')

## Old way og Making Histogram problem setting xlim

hist(data1$V1,main="Resolution of the Dataset",
     xlab = "Resolution (A)",
     ylab="Number of Images",
     col="blue",
     #xlim <- c(1,10),
     breaks=10
    )

## Using ggplot2

barfill <-"deepskyblue2"
barlines <-"black"
g1 = ggplot(data=data1,aes(x=data1$V1))+ geom_histogram(binwidth=0.5,fill=barfill,colour=barlines)+
     scale_x_continuous(name="Resolution (A)",
                        breaks=seq(2,7,0.5),
                        limits=c(0,10))+
     scale_y_continuous(name="Number of Images")+theme_bw()+
     ggtitle("Resolution of the Dataset")+theme(plot.title = element_text(hjust = 0.5,face = 'bold',size=25))+
      theme(axis.text.x = element_text(size=12))+
      theme(axis.text.y = element_text(size=12))+
      theme(axis.title.x = element_text(size=14))+
      theme(axis.title.y = element_text(size = 14))
#font size of the axis numbers
g1

       



