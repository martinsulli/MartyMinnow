#' @title Simulate results of a behaviour experiment
#' @description This function simulates the outcome of a behavioural (stress-gulping) assay from a given input set of treatments
#' @param treatments  Explanatory variable values in experimental treatments
#' @param params Parameters used by *suitability* to generate environment relationship. Don't worry about this as this function is only called internally.
#' @export
#' @author Martin Sullivan

behaviour_experiment<-function(treatments,params){
  pscore<-suitability(treatments[,1],treatments[,2],save.parms=FALSE,params[1],params[2],params[3],params[4],params[5],params[6])
  gulps<-generate_gulp(pscore)
  deaths<-generate_death(pscore)
  out<-data.frame("gulps"=gulps,"deaths"=deaths)
  cbind(treatments,out)
}
