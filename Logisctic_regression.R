Extracted_Vehicle_Data2$guzzler[is.na(Extracted_Vehicle_Data2$guzzler)] <- "Not taxed"
library(ggplot2)


ggplot(Extracted_Vehicle_Data2, aes(x = guzzler, y = displ)) +
  geom_boxplot() +
  labs(title = "Engine Displacement by Guzzler Category", x = "Guzzler", y = "Engine Displacement") +
  theme_minimal()
ggplot(Extracted_Vehicle_Data2, aes(x = guzzler, y = cylinders)) +
  geom_boxplot() +
  labs(title = "Number of Cylinders by Guzzler Category", x = "Guzzler", y = "Number of Cylinders") +
  theme_minimal()
library(dplyr)

Extracted_Vehicle_Data2 <- Extracted_Vehicle_Data2 %>%
  mutate(trany = case_when(
    grepl("Manual", trany) ~ "Manual",
    grepl("Automatic \\(AM\\)", trany) ~ "Automated Manual",
    grepl("Automatic \\(AV\\)", trany) ~ "Continuously Variable",
    grepl("Automatic \\(S\\)", trany) ~ "Semi-Automatic",
    grepl("Automatic", trany) ~ "Automatic",
    TRUE ~ "Other"
  ))

ggplot(Extracted_Vehicle_Data2, aes(x = guzzler, y = trany, color = guzzler)) +
  geom_jitter(width = 0.2, alpha = 0.7) +
  labs(title = "Jitter Plot of Transmission by Guzzler Category", x = "Guzzler", y = "Transmission") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
library(dplyr)
library(nnet)
Extracted_Vehicle_Data2$guzzler <- as.factor(Extracted_Vehicle_Data2$guzzler)  # Ensure guzzler is a factor

model <- multinom(guzzler ~ cylinders + displ, data = Extracted_Vehicle_Data2, trace = FALSE)

summary(model)

# Fit the null model (only intercept)
null_model <- multinom(guzzler ~ 1, data = Extracted_Vehicle_Data2, trace = FALSE)

# Get the null deviance
null_deviance <- deviance(null_model)
null_deviance