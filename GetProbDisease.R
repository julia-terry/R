#The probability of a disease comes down to prevalence, sensitivity, and specificity
#This is a function returning the probability given these three parameters

getProbDisease = function(prevalence=NA, sensitivity=NA, specificity=NA){
  A= prevalence
  notA= 1- prevalence
  B_given_A= sensitivity
  notB_given_notA= specificity
  B_given_notA=1-specificity 
  
  A_given_B = (A*B_given_A)/(A*B_given_A+notA*B_given_notA)
  ##print(A_given_B)
  return(A_given_B)
}

