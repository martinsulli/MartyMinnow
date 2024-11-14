#' @title Save the Marty Minnow
#' @description Put your work into practice and see if you can save the Marty Minnow. This function takes interative input, and asks you to set the temperature and pH you recommend keeping your minnows at. It will then simulate how many minnows survive - have you saved the minnow, or is there something fishy with your advice?
#' @export
#' @author Martin Sullivan

save_minnow<-function(){
  print("What conditions should Marty Minnow be kept at?")
  z<-readline("Temperature")
  z2<-readline("pH")
  z <- as.numeric(unlist(strsplit(z, ",")))
  z2 <- as.numeric(unlist(strsplit(z2, ",")))
  ps<-c(-10,3,-0.3,5,-0.6,-0.02)
  prob<-suitability(z,z2,FALSE,ps[1],ps[2],ps[3],ps[4],ps[5],ps[6])
  deaths<-sum(generate_death(rep(prob,100)))
  print(paste(deaths,"of 100 minnows have died"))
  if(deaths>50){
    print("Oh dear, the zoo are not happy!")
  }
  if(deaths<=50 & deaths > 0){
    print("Not too bad")
  }
  if(deaths ==0){
    print("Congratulations! You have earned your minnow saving badge!")
  }
}
