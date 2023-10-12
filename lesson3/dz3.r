library(dplyr)
df <- read.csv(file = "C:/Users/Krasnblu/Desktop/lesson3/ДЗ3_superstore_data.csv", header = TRUE, encoding = "utf-8")
print(head(df, 3))
df1 <- df %>% filter(Income > 30000) #Пункт 1
df1 <- df1 %>% select("Id", "Year_Birth", "Education", "Marital_Status", "Income", "Response") #Пункт 2
df1 <- mutate(df1, Age = 2023 - Year_Birth,RichFlag = ifelse(Income >80000, "True","False")) #Пункт 3
df2 <- df1 %>% group_by(Education) %>% summarize(mean = mean(Income)) #Пункт 4
df3 <- left_join(df1,df2,by = "Education") #Пункт 5