line_to_vector<-function(line){
  vector<-(as.numeric(as.vector(unlist(strsplit(line," ")),mode="list")))
  vector<-vector[!is.na(vector)]
  return(vector)
}
act_labels<-read.csv("C:/STSPS/lab4/activity_labels.txt",header=FALSE, dec=".", sep=" ")
colnames(act_labels)<-c("n","activity")

test_lines<-readLines(file("C:/STSPS/lab4/test/X_test.txt", open="r"))
train_lines<-readLines(file("C:/STSPS/lab4/train/X_train.txt", open="r"))
data_lines<-c(test_lines,train_lines)

test_act_numb<-readLines(file("C:/STSPS/lab4/test/Y_test.txt", open="r"))
train_act_numb<-readLines(file("C:/STSPS/lab4/train/Y_train.txt", open="r"))
act_numbers<-c(test_act_numb,train_act_numb)

mx<-as.vector(unlist(lapply(data_lines, function(i){weighted.mean(line_to_vector(i))})))
dx<-as.vector(unlist(lapply(data_lines, function(i){var(line_to_vector(i))})))
activities<-as.vector(unlist(lapply(act_numbers, function(i){return(act_labels[act_labels[["n"]]==i,"activity"])})))

data<-cbind.data.frame(activities,mx,dx)
colnames(data)<-c("activity","mx","dx")

mean_act<-as.vector(unlist(act_labels[["activity"]]))
mean_mx<-do.call(rbind,(lapply(mean_act, function(i) mean(data[data[["activity"]]==i,"mx"]))))
mean_dx<-do.call(rbind,(lapply(mean_act, function(i) mean(data[data[["activity"]]==i,"dx"]))))

mean_data<-cbind.data.frame(mean_act, mean_mx, mean_dx)
colnames(mean_data)<-c("mean_act", "mean_mx", "mean_dx")
mean_data