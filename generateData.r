trial_limit <- 1000
trial <- 1:trial_limit
MontyHall <- data.frame(trial)
print(str(MontyHall))

for (i in trial) { MontyHall$prizeDoor[i] <- sample(1:3,1) };

MontyHall$firstChoice <- sample(1:3,trial_limit,replace=TRUE)  

MontyHall$selectedWinner <- MontyHall$firstChoice == MontyHall$prizeDoor;

for (i in trial) {
  if(MontyHall$selectedWinner[i]){
    MontyHall$revealedDoor[i] <-  sample(c(1:3)[- which(c(1:3) == MontyHall$firstChoice[i])],1)
  } else {
    t <- c(1:3)[-which(c(1:3)==MontyHall$firstChoice[i])]; 
    MontyHall$revealedDoor[i] <- 
      t[-which(t==MontyHall$prizeDoor[i])]
  }
}

MontyHall$switchChoice <- sample(c(TRUE, FALSE), trial_limit,
                                 replace=TRUE) 
MontyHall$action[MontyHall$switchChoice] <- "switched"
MontyHall$action[!MontyHall$switchChoice] <- "stayed"
for (i in trial) {
  if (MontyHall$switchChoice[i]){ 
    t <- c(1:3)[-which(c(1:3)==MontyHall$firstChoice[i])]; 
    MontyHall$finalChoice[i] <- 
      t[-which(t==MontyHall$revealedDoor[i])]
  } else {
    MontyHall$finalChoice[i] <- MontyHall$firstChoice[i]
  }
}

MontyHall$winner <- MontyHall$finalChoice == MontyHall$prizeDoor
MontyHall$outcome[MontyHall$winner] <- "won"
MontyHall$outcome[!MontyHall$winner] <- "lost"

write.table(MontyHall, 
            file = "output_data.txt", 
            sep = "\t", 
            row.names = FALSE, 
            quote = FALSE) 
