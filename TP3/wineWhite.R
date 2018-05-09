# Load needed packages
library(neuralnet)
library(hydroGOF)

# Read file to memory
data <- read.csv("~/Desktop/SRCR/Trabalhos/Local/TP3/Dados/winequality-white-formatado.csv", header=TRUE, sep=";", dec=".")

# Mix data
#data <- data[sample(nrow(data)), ]

# Training set
training <- data[1:3000,]

# Testing set
test <- data[3001:4898,]



# --------------
#	Teste A	-> All the atributes	
# --------------

 # Formula to calculate FatigueLevel
  formula_A <- quality ~ fixed_acidity + volatile_acidity + citric_acid + residual_sugar + chlorides + free_sulfur_dioxide + total_sulfur_dioxide + density + pH + sulphates + alcohol
 
 # See the most important atributes
  selecao_A <- regsubsets(formula_A,data,method="backward")
  summary(selecao_A)
  
  # Train neural network to predict FatigueLevel
  rna_A <- neuralnet(formula_A, training, hidden = c(6,4,2), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_A, rep = "best")
  
  # Define input and test variables
  test_A <- test
  
  # Test the neural net with new cases
  rna_A.results <- compute(rna_A, test_A)
  
  # Print the results
  results_A <- data.frame(current = test$quality, prediction = rna_A.results$net.result)
  
  # Round the results
  results_A$prediction <- round(results_A$prediction, digits = 0)
  
  # Calculate RMSE
  rmse(c(test$quality), c(results_A$prediction))
  
  # Plot RMSE
  plot(results_A$current, results_A$prediction)



# --------------
#	Teste B	-> Without residual sugar and density
# --------------

# Formula to calculate FatigueLevel
  formula_B <- quality ~ fixed_acidity + volatile_acidity + citric_acid + chlorides + free_sulfur_dioxide + total_sulfur_dioxide + pH + sulphates + alcohol
  
  # See the most important atributes
  selecao_B <- regsubsets(formula_B,data,method="backward")
  summary(selecao_B)
  
  # Train neural network to predict FatigueLevel
  rna_B <- neuralnet(formula_B, training, hidden = c(5,3), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_B, rep = "best")
  
  # Define input and test variables
  test_B <- subset(test, select = c("fixed_acidity", "volatile_acidity", "citric_acid", "chlorides","free_sulfur_dioxide","total_sulfur_dioxide","pH","sulphates","alcohol"))
  
  # Test the neural net with new cases
  rna_B.results <- compute(rna_B, test_B)
  
  # Print the results
  results_B <- data.frame(current = test$quality, prediction = rna_B.results$net.result)
  
  # Round the results
  results_B$prediction <- round(results_B$prediction, digits = 0)
  
  # Calculate RMSE
  rmse(c(test$quality), c(results_B$prediction))
  
  # Plot RMSE
  plot(results_B$current, results_B$prediction)


