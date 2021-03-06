% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cvfl2_fixa.R
\name{cv.fl2_fixa}
\alias{cv.fl2_fixa}
\title{Description of the function}
\usage{
cv.fl2_fixa(response, regressors, group, a, lambda = NULL, mina = 0.1,
  nfold = 5, nrep = 20, nb.cores = 3, plot = TRUE)
}
\arguments{
\item{response}{a vector response variable}

\item{regressors}{a quantitative matrix of regressor}

\item{group}{a vector with two levels. (The group of the ANCOVA)}

\item{a}{the parameters that indicate how much the coefficients will be fused}

\item{lambda}{if the user wants to use it owns values of lambdas}
}
\value{
The coefficients of the fused lasso ANCOVA for the different value of lambda
}
\description{
Description of the function
}
\examples{
B <- c(1, -1, 1.5, 1.5, rep(0, 6), 2, 0, 2, 0)
group <- c(rep('M1', 10), rep('M2', 10))
regressors <- matrix(rnorm(6*20), ncol = 6)
X  <- model.matrix(~group + group:regressors - 1)
y <- X\%*\%B + rnorm(20)
y <- scale(y)
mod1 <- bic.fl2(y, regressors, group)
mod <- cv.fl2_fixa(y, regressors, group, a = mod1[[3]])
coef(mod, s='lambda.min')
}
