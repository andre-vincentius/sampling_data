# sampling.sh

Line 1: #!/usr/bin/sh
Shebang bash line

Line 3: link="https://github.com/labusiam/dataset/raw/main/weather_data.xlsx"
Membuat variabel "link" dan memasukkan tautan dari dataset yang akan digunakan

Line 5: if [ -d "./data/" ]
Melakukan conditional statement, apakah (sudah) ada direktori "data"

Line 6: then
Jika conditional statement bernilai benar (TRUE, ada folder "data")

Line 7:	wget -P "./data/" $link
Command "wget" untuk mendownload file dari tautan di variabel $link dan disimpan
ke dalam parent directory "./data/"

Line 8: else
Jika conditional statement bernilai salah (FALSE, tidak/belum ada folder "data")

Line 9: mkdir data
Buat direktori folder "data" 

Line 10: wget -P "./data/" $link
Kemudian download (sama seperti line 7)

Line 11: fi
Penutup conditional statement if

Line 13: in2csv "./data/weather_data.xlsx" --sheet weather_2014 > "./data/weather_2014.csv"
Line 14: in2csv "./data/weather_data.xlsx" --sheet weather_2015 > "./data/weather_2015.csv"
Dari folder data, file weather_data.xlsx; convert dan simpan tab-sheet ke dalam format csv.
Sheet weather_2014 menjadi weather_2014.csv
Sheet weather_2015 menjadi weather_2015.csv

Line 16: csvstack "./data/weather_2014.csv" "./data/weather_2015.csv" > "./data/weather.csv"
Menggabungkan kedua file csv tadi dan simpan ke dalam satu file csv bernama weather.csv

Line 18: rm "./data/weather_data.xlsx"
Menghapus file weather_data.xlsx

Line 20: cat "./data/weather.csv" | sample -r 0.3 > sample_weather.csv
Menghasilkan stdout dari weather.csv kemudian dengan tool sample-stream, stdout (yaitu isi dari
weather.csv dilakukan sampling dengan rate sampling sebesar 30% (menampilan 30% data acak dari
file weather.csv) 
