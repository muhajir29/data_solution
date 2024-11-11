
-- Masalah: 
-- kita memiliki dari agregasi total_volume_sold setiap bulannya. 
-- untuk menghitung total sold terbanyak dari tanggal 1 hingga tanggal 7 oktober, 
-- kita membutuhkan data penjualan product setiap harinya, dan datanya tidak tersedia 

-- Asumsi 
--karena data tidak tersedia kita melakukan beberapa asumsi
-- 1. transaksi dimulai dari tanggal 1 oktober
-- 2. data yang di berikan, merupakan data transaksi tanggal 1 - 6 oktober ini berdasarkan created_at 
--    data tersebut pada tanggal 6 oktober 

-- Solusi 
-- Pendekatan rata-rata
-- untuk mengetahui jumlah sold harian, kita melakukan pendekatan rata-rata.
-- dengan pendekatan rata-rata, kita mendapatkan rata-rata transaksi merupakan transaksi setiap harinya 
-- maka, jumlah sold harian ~ avg_sold_daily = total_volume_sold / 6, 
-- nilai ini akan kita jadikan sebagai nilai sold setiap harinya. 
-- oleh karena itu untuk menghitung total sold dari tanggal 1 sampai dengan 7 oktober
-- kita bisa mengkalikan avg_sold_daily x 7 
-- berikut adalah querynya

with avg_daily as
	(select product_id, merchant_id , (total_volume_sold / 6) as avg_sold_daily, price  
	from data_magpie dm )
select product_id, merchant_id, (avg_sold_daily * 7) as sold , price 
from avg_daily
order by 3 desc 
limit 10


-- Note
-- pengerjaan menggunakan chat GPT, hanya untuk memvalidasi pendekatan untuk case di atas,
-- dan ternyata pendekatan nya sama saja seperti yang dilakukan di atas yaitu menggunaan pendekatan rata-rata. 
