# Load needed packages
library(neuralnet)
library(hydroGOF)
library(arules)
library(leaps)

# Read file to memory
data <- read.csv("~/Desktop/SRCR/Trabalhos/Local/TP3/Dados/winequality-all-type.csv", header=TRUE, sep=",", dec=".")

# Mix data
#data <- data[sample(nrow(data)), ]

# Training set
training <- data[1:5000,]

# Testing set
test <- data[5001:6497,]



# --------------
#	Teste A	-> Weka atributes	
# --------------

 # Formula to calculate quality of the wines
  formula_A <- quality ~ fixed_acidity + volatile_acidity + citric_acid + residual_sugar + chlorides + free_sulfur_dioxide + total_sulfur_dioxide + density + pH + sulphates + alcohol + type
 
 # See the most important atributes
  selecao_A <- regsubsets(formula_A,data,method="backward")
  summary(selecao_A)
  
  # Formula to calculate quality of the wines with weka's most important atributes
  formula_Weka <- quality ~ citric_acid + alcohol + type
  
  # Train neural network to predict Quality of the wines
  rna_Weka <- neuralnet(formula_Weka, training, hidden = c(6,4,2), lifesign = "full", linear.output = TRUE, threshold = 0.1)
  
  # Plot neural network
  plot(rna_Weka, rep = "best")
  
  # Define input and test variables
  test_Weka <- subset(test, select=c("citric_acid" , "alcohol" , "type"))
  
  # Test the neural net with new cases
  rna_Weka.results <- compute(rna_Weka, test_Weka)
  
  # Print the results
  results_Weka <- data.frame(current = test$quality, prediction = rna_Weka.results$net.result)
  
  # Round the results
  results_Weka$prediction <- round(results_Weka$prediction, digits = 0)
  
  # Calculate RMSE
  rmse(c(test$quality), c(results_Weka$prediction))
  
  # Plot RMSE
  plot(results_Weka$current, results_Weka$prediction)
  
  


# --------------
#	Teste B	-> With R atributtes
# --------------

  # Formula to calculate quality of the wines with weka'a most important atributes
  formula_R <- quality ~ free_sulfur_dioxide + sulphates + alcohol + type
  
  # Train neural network to predict Quality
  rna_R <- neuralnet(formula_R, training, hidden = c(5,3), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_R, rep = "best")
  
  # Define input and test variables
  test_R <- subset(test, select = c("free_sulfur_dioxide" , "sulphates","alcohol" , "type"))
  
  # Test the neural net with new cases
  rna_R.results <- compute(rna_R, test_R)
  
  # Print the results
  results_R <- data.frame(current = test$quality, prediction = rna_R.results$net.result)
  
  # Round the results
  results_R$prediction <- round(results_R$prediction, digits = 0)
  
  # Calculate RMSE
  rmse(c(test$quality), c(results_R$prediction))
  
  # Plot RMSE
  plot(results_R$current, results_R$prediction)
