#Memanggil Library
library(tidyverse)
library(pracma)
library(gapminder)
library(ggplot2)
library(data.table)
library(assertive)

#Memanggil dataset
data <- read.csv('E:/DATASET/covid/covid_19_indonesia_time_series_all.csv')

#Melihat struktur dataset
str(data)

#Menghapus kolom yang tidak perlu
data <- data[-c(13,15:16,18,38:41)]

#Kolom terbaru
names(data)

#Menghitung jumlah null pada data
sum(is.na(data))

#Mengubah nama data
names(data)[c(1,4:11)] <- c("tanggal","new_cases","meninggal","sembuh","aktif",
                          "total_kasus","total_meninggal", "total_sembuh","total_aktif")


#Memfilter data dengan data yang dipilih hanya provinsi Jawa Barat
data_jabar <-
  data %>%
    filter(Location == "Jawa Barat") %>%
    subset(tanggal > "6/30/2021")

head(data_jabar)

#Total Kasus Harian
ggplot(data_jabar,aes(tanggal,new_cases))+
  geom_col(fill ="salmon")+
  labs(
    x= "Tanggal",
    y= "Kasus Harian",
    title = "Total Kasus harian di Jawa Barat",
    subtitle = "Tiap harinya, kasus terbaru cenderung mengalami peningkatan",
    caption = "Sumber : Kaggle"
  )

#Total Kasus Sembuh
ggplot(data_jabar,aes(tanggal,sembuh))+
  geom_col(colour = "green")+
  labs(
    x="Tanggal",
    y= "Sembuh",
    title = "Banyak nya sembuh perhari",
    subtitle = "Sembuh Mengalami Peningkatan",
    caption = "Sumber : Kaggle.com"

  )