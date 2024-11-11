with cleaning as (
	select product_id, merchant_id, total_volume_sold, price, 
	replace(split_part(meta_data, ',', 2), '"', '') as email  from 
	data_magpie dm ), 
top_product as (
	select 'product' as qualification, email as top_contributor, count(product_id)
	from cleaning
	group by email
	order by count(product_id) desc
	limit 1), 
top_merchant as (
	select 'distinc_shop' as qualification, email as top_contributor, count(distinct merchant_id) 
	from cleaning
	group by email
	order by count(distinct merchant_id) desc
	limit 1 
)
select qualification, top_contributor 
from top_product
union all 
select qualification, top_contributor
from top_merchant;

-- Note
-- pengerjaan ini tidak menggunakan chatGPT, 
-- menggunakan search engine google, untuk mencari tau syntaks yang lupa 
