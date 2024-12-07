% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/simulate_data.R
\name{simulate_data}
\alias{simulate_data}
\title{Simulate data based on a study design}
\usage{
simulate_data(env)
}
\arguments{
\item{env}{Explanatory variables sampled by the study design. Produced by \emph{design_study}.}
}
\description{
This function takes takes a study design generated by \emph{design_study} and simulates data that would be collected using it.
Note - if you have chosen both an experiment and a field study, \emph{design_study} will return a list. \emph{simulate_data} will take that list, and return a list in turn.
}
\author{
Martin Sullivan
}
