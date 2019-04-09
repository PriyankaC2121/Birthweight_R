
# Predicting mothers with pregnancy giving rise to babies with low birthweight

library(lmtest)
library(ggplot2)
library(plotly)
library(rpart)
library(rpart.plot)
library(readr)


View(birthwt)
birthwt <- as.data.frame(birthwt)
summary(birthwt)



birthwt_e <- as.data.frame(birthwt[ , 1:9])
View(birthwt_e)

# Build tree
birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = 0.013)
rpart.plot(birthwt_tree, type = 1, extra = 1)
plotcp(birthwt_tree)

# ^ important parameters are 4: ptl, lwt , ht, age 


hist(birthwt$bwt)


############## Using low as the binary variable

birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = 0.013)
rpart.plot(birthwt_tree, type = 1, extra = 1)

birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = 0.001)
rpart.plot(birthwt_tree, type = 1, extra = 1)

# ^ no difference when decrease cp

birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = 0.05)
rpart.plot(birthwt_tree, type = 1, extra = 1)

# Increase cp, important parameters: 3 : ptl, lwt, age



############## Using ftv as the binary variable
 
 
birthwt_e_ftv <- as.data.frame(birthwt_e)
View(birthwt_e_ftv)

for(i in 1:nrow(birthwt_e_ftv)){
  if(birthwt_e_ftv$ftv[i] == 0 || birthwt_e_ftv$ftv[i] == 1 || birthwt_e_ftv$ftv[i] == 2) {birthwt_e_ftv$ftv_bin[i] <- 0} 
  else {birthwt_e_ftv$ftv_bin[i] <- 1}
}

View(birthwt_e_ftv)
summary(birthwt_e_ftv)

birthwt_ftv_tree <- rpart(ftv_bin ~ ui + ht + smoke, data = birthwt_e_ftv, method = 'class', cp = 0.05)
rpart.plot(birthwt_ftv_tree, type = 1, extra = 1)

## No correleation for above with ftv_bin

birthwt_ftv_tree <- rpart(ui ~ ., data = birthwt_e_ftv, method = 'class', cp = 0.013)
rpart.plot(birthwt_ftv_tree, type = 1, extra = 1)
# ^ important: lwt, ptl, age


 
############## Using low as the binary variable 
birthwt_logit <- glm(low ~ ptl + lwt + ht + age , data = birthwt_e, family = 'binomial')
summary(birthwt_logit)
exp(birthwt_logit$coefficients)


############## Using ftv as the binary variable

birthwt_logit <- glm(ftv_bin ~ ui + ht + smoke, data = birthwt_e_ftv, family = 'binomial')
summary(birthwt_logit)
# implies not significant 






