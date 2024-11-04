#' @title Design your study
#' @description This function takes the user through a sequence of interactive options to get them to design their study. You will be asked
#' * Do you want to do an experiment, a field study or both
#' * If you do an experiment, do you want to look at one variable at a time, or use a factorial design?
#' * What levels of each variable to you want to set as experimental treatments. E.g. 5C, 10C, 15C.
#' * How many replicates do you want of each treatment
#' * If you are doing field sampling, so you want samples to sample in a local area (cheaper), over a large-scale (expensive but samples wider range of environmental conditons) or clustered (some spatially distance sampling locations, then local-scale sampling around these)
#' * How many samples you want to take
#' The function will simulate data based on your design, and print the cost of your design
#' @author Martin Sullivan

design_study <- function(){
  out<-c()
  out2<-c()
  study.type<-menu(c("Experiment", "Field survey", "Both"), title="What kind of study do you want to do?")

  if(study.type%in%c(1,3)){
    print("Let us start designing the experiment!")
    experiment.type<-menu(c("One variable at a time","Factorial","Surprise me!"),title="What experimental design type do you want?")
    if(experiment.type==3)experiment.type<-sample(c(1,2),1)
    x <- readline("What temperature values do you want to have as treatments? Seperate each with a comma (i.e. 1,2,4)")
    y <- readline("What pH values do you want to have as treatments? Seperate each with a comma (i.e. 1,2,4)")
    n <- readline("How many replicates do you want for each treatment?")
    if(experiment.type==1){
      z<-readline("When varying temperature, what should the pH be?")
      z2<-readline("When varying pH, what should the temperature be?")
      z <- as.numeric(unlist(strsplit(z, ",")))
      z2 <- as.numeric(unlist(strsplit(z2, ",")))
    }

    x <- as.numeric(unlist(strsplit(x, ",")))
    y <- as.numeric(unlist(strsplit(y, ",")))
    n <- as.numeric(unlist(strsplit(n, ",")))


    if(experiment.type==1){
      exp1<-data.frame("Temp"=x,"pH"=z)
      exp2<-data.frame("Temp"=z2,"pH"=y)
      exp1.1<-c()
      exp2.1<-c()
      for(i in 1:n){
        exp1.1<-rbind(exp1.1,exp1)
        exp2.1<-rbind(exp2.1,exp2)
      }
      out<-rbind(exp1.1,exp2.1)
    }else{
      exp1<-expand.grid("Temp"=x,"pH"=y)
      out<-c()
      for(i in 1:n){
        out<-rbind(out,exp1)
      }
    }
    experiment.cost<-100*nrow(out)
    print(paste0("Your experiment costs",experiment.cost, "pounds"))
  }
  if(study.type%in%c(2,3)){
    print("Let's start designing the field sampling!")
    sampling.type<-menu(c("Local","Large-scale","Clustered"),title="How should sampling areas be distributed?")
    if(sampling.type%in%c(1,2)){
      samples<-readline("How many samples do you want to take?")
    }
    if(sampling.type==3){
      clusters<-readline("How many cluster locations do you want to sample?")
      samples<-readline("How many samples do you want to take in each cluster")
      clusters <- as.numeric(unlist(strsplit(clusters, ",")))

    }
    samples <- as.numeric(unlist(strsplit(samples, ",")))

    if(sampling.type==1){
      x<-runif(samples,40,60)
      y<-runif(samples,40,60)
      cost.obs<-50*samples
    }
    if(sampling.type==2){
      x<-runif(samples,0,100)
      y<-runif(samples,0,100)
      cost.obs<-200*samples
    }
    if(sampling.type==3){
      xcent<-runif(clusters,0,100)
      ycent<-runif(clusters,0,100)
      x<-c()
      y<-c()
      for(i in 1:clusters){
        x<-c(x,runif(samples,xcent[i]-5,xcent[i]+5))
        y<-c(y,runif(samples,ycent[i]-5,ycent[i]+5))
      }
      cost.obs<-200*clusters + 50*(samples-1)*clusters
    }
    temp<-0.3*y
    pH<-0.1*x
    pH[pH<0]<-0
    pH[pH>12]<-12
    out2<-data.frame("Temp"=round(temp,1),"pH"=round(pH,2))
    print(paste0("Your field sampling costs",cost.obs, "pounds"))
  }
  list(out,out2)
}
