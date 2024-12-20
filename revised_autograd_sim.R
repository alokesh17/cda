##simulation code
library(tweedie)
n <- 3e3
p <- 40  # 40 covariates in mean model excluding intercept
q <- 40  # 40 covariates in dispersion model excluding intercept

beta.true <- rep(0,(p+1))

# intercept+first 10 true betas are non-zero, rest are zero
beta.true[1:11] <- c(1,seq(from=0.1, to= 1.7, length=10))

# mean and dispersion model design matrices same
# filled with iid N(0,1) draws
X = Z = matrix(rnorm(n*p),nrow = n,ncol=p)
X = matrix(rnorm(n*p),nrow = n,ncol=p)


# center scale columns of design matrices
X = apply(X, 2, function(s) (s - mean(s))/sd(s))
Z = apply(Z, 2, function(s) (s - mean(s))/sd(s))


tweedie_power_param.true <- 1.5

# intercept+first 2 true gammas are non-zero, rest are zero
gamma.true <- rep(0,(q+1))
gamma.true[1:3] <- c(1, 0.5, -2.5)

y <-
  rtweedie(n,
           power = tweedie_power_param.true,
           mu = exp(cbind(1,X)%*%beta.true),
           phi = exp(cbind(1,Z)%*%gamma.true))

phi.true <- 3.5

# y <-
#   rtweedie(n,
#            power = tweedie_power_param.true,
#            mu = exp(cbind(1,X)%*%beta.true),
#            phi = exp(rep(1,n)*log(phi.true)))

range(y)

sum(y==0)/length(y) # 0.4046667 ~ 41% zeros

var(y)

Z=matrix(1,ncol=1,nrow=nrow(X))

fit<- ssdglm.autograd_modified (y = y,
                          x = X,
                                     z = Z,
                                     beta.init = NULL,
                                     gamma.init = NULL,
                                     xi.init = NULL,
                                     alpha.beta.init = NULL,
                                     alpha.gamma.init = NULL,
                                     zeta.beta.init = NULL,
                                     zeta.gamma.init = NULL,
                                     sigma2.beta.init = NULL,
                                     sigma2.gamma.init = NULL,
                                     shape.sigma2.beta = NULL,
                                     shape.sigma2.gamma = NULL,
                                     rate.sigma2.beta = NULL,
                                     rate.sigma2.gamma = NULL,
                                     lower.xi = 1,
                                     upper.xi = 2,
                                     nu0 = 1e-4,
                                     tau.beta = 1e-1,
                                     tau.gamma = 1e-1,
                                     tau.xi = 1e-1,
                                     niter = NULL,
                                     nburn = NULL,
                                     report = NULL,
                                     thin = 1,
                                     return.mcmc = TRUE,
                                     verbose = FALSE,
                                     track = FALSE,
                                     digits = 3,
                                     reg.factor = 0)

summary(fit)

fit
