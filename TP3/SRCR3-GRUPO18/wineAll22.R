# Load needed packages
library(neuralnet)
library(hydroGOF)
library(arules)
library(leaps)

# Read file to memory
data <- read.csv("~/Desktop/SRCR/Trabalhos/Local/TP3/Dados/winequality-all-22.csv", header=TRUE, sep=",", dec=".")

# Mix data
#data <- data[sample(nrow(data)), ]

# Training set
training <- data[1:5000,]

# Testing set
test <- data[5001:6497,]



# --------------
# Teste A -> With R atributtes 
# --------------

 # Formula to calculate Quality
  formula_A <- quality ~ fixed_acidity_red + volatile_acidity_red + citric_acid_red + residual_sugar_red + chlorides_red + free_sulfur_dioxide_red + total_sulfur_dioxide_red + density_red + pH_red + sulphates_red + alcohol_red + fixed_acidity_white + volatile_acidity_white + citric_acid_white + residual_sugar_white + chlorides_white + free_sulfur_dioxide_white + total_sulfur_dioxide_white + density_white + pH_white + sulphates_white + alcohol_white + type
 
 # See the most important atributes
  selecao_A <- regsubsets(formula_A,data,method="backward")
  summary(selecao_A)
  
  # Formula to calculate quality of the wines with weka'a most important atributes
  formula_R <- quality ~ sulphates_red + alcohol_red + free_sulfur_dioxide_white + alcohol_white
  
  # Train neural network to predict Quality
  rna_R <- neuralnet(formula_R, training, hidden = c(5,3), lifesign = "full", linear.output = TRUE, threshold = 0.01)
  
  # Plot neural network
  plot(rna_R, rep = "best")
  
  # Define input and test variables
  test_R <- subset(test, select = c("sulphates_red" , "alcohol_red" , "free_sulfur_dioxide_white" , "alcohol_white"))
  
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
  
  
  