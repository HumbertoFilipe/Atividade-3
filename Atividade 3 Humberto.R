## O objetivo � estudar as estat�sticas do time de basquete norte-americano
## Golden State Warriors (GSW)

library(rvest)
library(dplyr)
library(janitor)
library(lubridate)
library(tidyselect)
library(ggplot2)

# Buscando as informa��es no site
gsw=read_html("https://www.basketball-reference.com/teams/GSW/2022.html")
gsw

# Organizando
idade=gsw %>%
  html_element("#per_game") %>%
  html_table()

# Gr�fico 1: Idade de cada um dos atuais jogadores do GSW
ggplot(idade, aes(x=Rk, y=Age)) +
  geom_bar(stat="identity") +
  labs(title = "Idade dos jogadores do GSW", y ="Idade", x ="Jogadores")

# Gr�fico 2: M�dia dos minutos jogados por jogo dos jogadores do GSW 
ggplot(idade, aes(x=Rk, y=MP)) +
  geom_point(stat="identity") +
  labs(title = "Minutos jogados por jogo dos jogadores do GSW", y ="Minutos por jogo", x ="Jogadores")

# Na tabela idade tem o nome dos jogares referentes a cada n�mero

