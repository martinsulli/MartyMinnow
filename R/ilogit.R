#' @title ilogit
#' @description Inverse logit transformation
#' @param x Variable to be inverse logit transformed
#' @author From the Faraway package

ilogit<-function (x)
{
  if (any(omit <- is.na(x))) {
    lv <- x
    lv[omit] <- NA
    if (any(!omit))
      lv[!omit] <- Recall(x[!omit])
    return(lv)
  }
  exp(x)/(1 + exp(x))
}
