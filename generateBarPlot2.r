MontyHall3 <- read.table("output_data.txt", header = TRUE, sep = "\t");

t <- table(MontyHall3$outcome, MontyHall3$action)
png("barplot2_output.png", width = 800, height = 600, res = 100);

barplot(t,
        xlab="wins", col=c("grey","black"),legend.text = TRUE, 
        args.legend = list(x = "topright",
                           inset = c(0.8, 0.84)))
dev.off()
