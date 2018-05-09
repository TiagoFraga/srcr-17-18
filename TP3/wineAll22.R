# Load needed packages
library(neuralnet)
library(hydroGOF)

# Read file to memory
data <- read.csv("~/Desktop/SRCR/Trabalhos/Local/TP3/Dados/winequality-all-22.csv", header=TRUE, sep=";", dec=".")

# Mix data
#data <- data[sample(nrow(data)), ]

# Training set
training <- data[1:3000,]

# Testing set
test <- data[3001:4898,]



# --------------
# Teste A -> All the atributes  
# --------------

 # Formula to calculate FatigueLevel
  formula_A <- quality ~ fixed_acidity_red + volatile_acidity_red + citric_acid_red + residual_sugar_red + chlorides_red + free_sulfur_dioxide_red + total_sulfur_dioxide_red + density_red + pH_red + sulphates_red + alcohol_red + fixed_acidity_white + volatile_acidity_white + citric_acid_white + residual_sugar_white + chlorides_white + free_sulfur_dioxide_white + total_sulfur_dioxide_white + density_white + pH_white + sulphates_white + alcohol_white + type
 
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
# Teste B -> Without type 
# --------------

 # Formula to calculate FatigueLevel
  formula_B <- quality ~ fixed_acidity_red + volatile_acidity_red + citric_acid_red + residual_sugar_red + chlorides_red + free_sulfur_dioxide_red + total_sulfur_dioxide_red + density_red + pH_red + sulphates_red + alcohol_red + fixed_acidity_white + volatile_acidity_white + citric_acid_white + residual_sugar_white + chlorides_white + free_sulfur_dioxide_white + total_sulfur_dioxide_white + density_white + pH_white + sulphates_white + alcohol_white
 
 # See the most important atributes
  selecao_B <- regsubsets(formula_B,data,method="backward")
  summary(selecao_B)
  
  # Train neural network to predict FatigueLevel
  rna_B <- neuralnet(formula_B, training, hidden = c(5,3), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_B, rep = "best")
  
  # Define input and test variables
  test_B <- subset(test, select = c("fixed_acidity_red", "volatile_acidity_red", "citric_acid_red", "chlorides_red","free_sulfur_dioxide_red","total_sulfur_dioxide_red","pH_red","sulphates_red","alcohol_red","fixed_acidity_white", "volatile_acidity_white", "citric_acid_white", "chlorides_white","free_sulfur_dioxide_white","total_sulfur_dioxide_white","pH_white","sulphates_white","alcohol_white"))
  
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

# --------------
# Teste C -> Predict the quality and type
# --------------

 # Formula to calculate FatigueLevel
  formula_C <- quality + type ~ fixed_acidity_red + volatile_acidity_red + citric_acid_red + residual_sugar_red + chlorides_red + free_sulfur_dioxide_red + total_sulfur_dioxide_red + density_red + pH_red + sulphates_red + alcohol_red + fixed_acidity_white + volatile_acidity_white + citric_acid_white + residual_sugar_white + chlorides_white + free_sulfur_dioxide_white + total_sulfur_dioxide_white + density_white + pH_white + sulphates_white + alcohol_white
 
 # See the most important atributes
  selecao_C <- regsubsets(formula_B,data,method="backward")
  summary(selecao_C)
  
  # Train neural network to predict FatigueLevel
  rna_C <- neuralnet(formula_C, training, hidden = c(3), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_C, rep = "best")
  
  # Define input and test variables
  test_C <- subset(test, select = c("fixed_acidity_red", "volatile_acidity_red", "citric_acid_red", "chlorides_red","free_sulfur_dioxide_red","total_sulfur_dioxide_red","pH_red","sulphates_red","alcohol_red","fixed_acidity_white", "volatile_acidity_white", "citric_acid_white", "chlorides_white","free_sulfur_dioxide_white","total_sulfur_dioxide_white","pH_white","sulphates_white","alcohol_white"))
  
  # Test the neural net with new cases
  rna_C.results <- compute(rna_C, test_C)
  
  # Print the results
  results_C <- data.frame(current = test$quality, prediction = rna_C.results$net.result)
  
  # Round the results
  results_C$prediction <- round(results_C$prediction, digits = 0)
  
  # Calculate RMSE
  rmse(c(test$quality), c(results_C$prediction))
  
  # Plot RMSE
  plot(results_C$current, results_C$prediction)





