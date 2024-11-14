#' @title Suitability
#' @description Predict suitability given two environmental parameters. Can be set or will randomly generate.
#' @param v1 Environmental variable 1
#' @param v2 Environmental variable 2
#' @param save.parms Do you want to save parameters? If so will output a list.
#' @param a1 For me to know and you to find out, minnow marvelors
#' @param a2 ditto
#' @param a3 ditto
#' @param a4 likewise
#' @param a5 yep, see a1
#' @param a6 ditto
#' @param v2clamp Documenting these would be giving too much away, sorry!
#' @export
#' @author Martin Sullivan

suitability<-function(v1,v2,save.parms=FALSE,a1=-10,a2=3,a3=-0.3,a4=5, a5=-0.6,a6=-0.02,v2clamp=2){
  if(is.null(a1)){
    a1<-runif(1,-1,1)
    a2<-runif(1,-1,1)
    a3<-runif(1,-1,1)
    a4<-runif(1,-1,1)
    a5<-runif(1,-1,1)
    a6<-runif(1,-1,1)
  }
  v1<-v1
  p<-a1 + a2*v1 + a3*v1^2 + a4*v2 + a5*v2^2 + a6*v1*v2
  pstand<-ilogit(p)
  pstand[v2<v2clamp]<-0
  if(save.parms==TRUE){
    list(c(a1,a1,a3,a4,a5,a6),pstand)
  }else{
    pstand
  }
}
