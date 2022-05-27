### Aplikasi prediction tentang pembelian harga mobil berdasarkan budget 

[Mockup design](https://www.figma.com/file/2qKjV89j5jGLPjwMq60wDL/Ui-kuy-mancing?fuid=894805675517878148)

### Screenshot
Berikut ini adalah screenshot dari Aplikasi informasi & pemesanan tempat pemancingan . 

| No 	| page    	| halaman 	|  No 	| page    	| halaman 	|
|----	|----------	|----------	|----	|----------	|----------	|
| 1  	| login  	| ![Gambar halaman login](https://i.imgur.com/xC3QnvK.jpg)| 5  	|  search page 	| ![Gambar halaman search page](https://i.imgur.com/FOp30IQ.jpg)  	
| 2  	| home 	| ![Gambar halaman home](https://i.imgur.com/Xeyhaiy.jpg)	|  6  	| history page 	| ![Gambar halaman history page](https://i.imgur.com/QVCkAsJ.jpg)	|
| 3  	| detail  	|![Gambar halaman detail page](https://i.imgur.com/wY0KDZg.jpg)|  7  	| setting page 	|![Gambar halaman setting page](https://i.imgur.com/HDAP0f8.jpg)	|
| 4  	|  Booking page 	|![Gambar halaman Booking page](https://i.imgur.com/P7Pxl0S.jpg)|  8 	| sign up 	|![Gambar halaman sign up page](https://i.imgur.com/p1SOq77.jpg)	|
| 5  	|  forgotpassword 	|![Gambar halaman forgotpass page](https://i.imgur.com/iEBwrqX.jpg)|  

### Tentang
  Usaha tempat pemancingan adalah salah satu bidang usaha yang bergerak di bidang hiburan yaitu hobi saat akhir pekan. Penghobinya pun cukup banyak dari semua kalangan mulai dari kalangan orang tua hingga anak muda. Untuk itu dibutuhkan sebuah aplikasi berbasis mobile yang mampu memberikan informasi mengenai layanan maupun fasilitas kepada pelanggan atau konsumen dengan cepat melalui internet. Sebelumnya sistem booking hanya dilakukan dengan media telepon saja. Dengan adanya pemanfaatan teknologi ini pun para pelanggan dapat menemukan lokasi akses pemancingan dan juga pemesanan tempat untuk memancing.

### Fitur
- Authentication :
    - Login
    - Sign up
    - forgotpassword
- oparetor:
    - Detail dat place
    - read data place 
- pemesanan:
    - booking tempat
- hitory:
    - menampilkan data tempat booking

# Konfigurasi

### SIGN UP 
  USER mendaftarkan akun pada page ini setelah didaftarkan akan dialihkan ke akun login page 
### Login
  USER memasukan akun yang telah didaftarkan sebelumnya 
### forgotpassword
  USER memasukan email yang dipkai untuk mendaftar kedalam aplikasi
  
### Database menggunakan rest api
Untuk konfigurasi database pada firebase, silahkan ke providers auth dan cari file getplace.dart lalu cari code seperti ini :
``` Uri url = Uri.parse(
        "https://yukmancing-88624-default-rtdb.firebaseio.com/place.json?auth=$token");
```
Ubah :
- link yang digunakan untuk menyambungkan rest api pada user 

### Halaman Home
pada halaman ini user akan ditunjukan data tempat yang ditampilkan dan apabila user telah memilihnya makanya akan dialihkan ke halaman detail page 
Untuk saat ini, halaman home hanya mengambil beberapa database saja untuk ditampilkan. Seperti :
**Menampilkan nama tempat**,**Menampilkan gambar tempat**,**Menampilkan lokasi tempat**

### Halaman detail 
dihalaman ini user akan diberikan data lengkap mengenai tempat pemancingan tersebut, apabila user menyukainya maka tekang tombol booking untuk dialihkan kedalam pendaftaran 
pada halaman ini user akan ditunjukan data tempat yang ditampilkan dan apabila user telah memilihnya makanya akan dialihkan ke halaman detail page 
Untuk saat ini, halaman detail ini menampilkan secara lengkap database tempat

### Halaman booking 
dihalaman ini user akan diberikan form untuk diisi tentang data nama tanggal dan jam berapa yang yang akan dipesan, apabila user selesai mengisis form maka tekan tombol booking now dan data akan di masukan kedalam database 

### Halaman history
pada halaman ini digunakan untuk menampilkan data tentang pemesanan yang telah di isi pada from booking dan data tersebut akan ditampilkan kedalam history page
Untuk saat ini, halaman history hanya mengambil database history untuk ditampilkan. Seperti :
**Menampilkan tanggal tempat**, **Menampilkan waktu tempat**,**Menampilkan nama tempat**,**Menampilkan gambar tempat**,**Menampilkan lokasi tempat**

### Halaman search
pada halaman ini user dapat mencari search yang user ingin kan sesuai dengan nama tempat pemancingannya
halaman search hanya mengambil database history untuk ditampilkan. Seperti :
**Menampilkan tanggal tempat**, **Menampilkan waktu tempat**,**Menampilkan nama tempat**,**Menampilkan gambar tempat**,**Menampilkan lokasi tempat**

### Halaman setting 
pada halaman ini user dapat mengganti nama yang ditampilkan dan tombol log out untuk keluar dari aplikasi
Untuk saat ini, halaman setting hanya mengambil database history untuk ditampilkan. Seperti :
**Menampilkan tanggal tempat**, **Menampilkan waktu tempat**,**Menampilkan nama tempat**,**Menampilkan gambar tempat**,**Menampilkan lokasi tempat**
