#!/usr/bin/sh

link="https://github.com/labusiam/dataset/raw/main/weather_data.xlsx"

if [ -d "./data/" ]
then
	wget -P "./data/" $link
else
	mkdir data
	wget -P "./data/" $link
fi

in2csv "./data/weather_data.xlsx" --sheet weather_2014 > "./data/weather_2014.csv"
in2csv "./data/weather_data.xlsx" --sheet weather_2015 > "./data/weather_2015.csv"

csvstack "./data/weather_2014.csv" "./data/weather_2015.csv" > "./data/weather.csv"

rm "./data/weather_data.xlsx"

cat "./data/weather.csv" | sample -r 0.3 > sample_weather.csv
