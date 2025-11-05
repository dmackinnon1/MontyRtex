MontyHall2 <- read.table("output_data.txt", header = TRUE, sep = "\t");

png("barplot_output.png", width = 800, height = 600, res = 100);
barplot(table(MontyHall2$prizeDoor),xlab="Door");

dev.off()
