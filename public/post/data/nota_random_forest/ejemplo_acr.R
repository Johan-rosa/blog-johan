library(tidyverse)
library(rpart)
library(rpart.plot)

# Data
data <- structure(
  list(
    edad = c(18L, 20L, 25L, 40L, 45L, 30L, 24L, 22L, 50L, 21L, 33L, 22L, 45L), 
    salario = c("15000", "18000", "17000", "18000", "50000", "40000", 
                "16000", "30000", "15000", "25000", "10000", "5000", "15000"), 
    acepta = c("Sí", "Sí", "No", "No", "Sí", "Sí", "No", "Sí",
               "No", "Sí", "No", "No", "Sí")
  ), 
  class = "data.frame", row.names = c(NA, -13L)
)

data <- mutate(data, salario = parse_number(salario))

# gráfico 1
(p1 <- data %>% 
    ggplot(aes(x = edad, y = salario, color = acepta)) +
    geom_point(size = 2) +
    scale_y_continuous(labels = scales::comma) +
    theme_light() +
    theme(legend.position = "bottom") +
    labs(x = "Edad", y = "Salario", color = "¿Acepta?",
         title = "Original"))

ggsave("randonforest_methodology/p1.png")

(p2 <- data %>%
    ggplot(aes(x = edad, y = salario, color = acepta)) +
    geom_rect(aes(xmin = 0, xmax = 52, ymin = 22000, ymax = 51000),
              fill = "blue", alpha = 0.01, color = "black") +
    geom_point(size = 2) +
    scale_y_continuous(labels = scales::comma) +
    coord_cartesian(expand = FALSE, xlim = c(15, 52), ylim = c(4000, 51000)) +
    theme_light() +
    theme(legend.position = "bottom") +
    labs(x = "Edad", y = "Salario", color = "¿Acepta?",
         title = "Primer corte"))

ggsave("randonforest_methodology/p2.png")

(p3 <- data %>%
    ggplot(aes(x = edad, y = salario, color = acepta)) +
    geom_rect(aes(xmin = 0, xmax = 52, ymin = 22000, ymax = 51000),
              fill = "blue", alpha = 0.01, color = "black") +
    geom_rect(aes(xmin = 0, xmax = 21, ymin = 4000, ymax = 22000),
              fill = "blue", alpha = 0.01, color = "black") +
    geom_point(size = 2) +
    scale_y_continuous(labels = scales::comma) +
    coord_cartesian(expand = FALSE, xlim = c(15, 52)) +
    theme_light() +
    theme(legend.position = "bottom") +
    labs(x = "Edad", y = "Salario", color = "¿Acepta?",
         title = "Segundo corte"))

ggsave("randonforest_methodology/p3.png")

tree <- rpart(acepta ~., data = data,
              control =rpart.control(minsplit = 5, minbucket = 1, cp = 0)
              )

p4 <- rpart.plot(tree, main = "ACR")

ggsave("randonforest_methodology/p4.png", p4)


library(rpart)
library(rpart.plot)
