select 
	tu.user_id user_id ,	
	tu.user_first_name user_first_name ,
	tu.user_last_name user_last_name ,
	to2.order_id order_id ,
	to2.order_date order_date ,
	to2.order_price order_price ,
	to2.order_discount order_discount ,	
	toi.order_item_id order_item_id ,
	tp2.product_id product_id ,
	tp2.product_category_id product_category_id ,
	tpc.product_category_name product_category_name ,
	tp2.product_name product_name ,
	tp2.product_price product_price ,
	tp2.product_discount product_discount ,
	toi.order_item_quantity order_item_quantity,
	tp2.product_discount product_subdiscount ,
	toi.product_subprice product_subprice ,
	to2.order_total order_total ,	
	tp.payment_id payment_id ,
	tp.payment_name payment_name ,
	tp.payment_status payment_status ,
	ts.shipper_id shipper_id ,
	ts.shipper_name shipper_name ,
	tv.voucher_id voucher_id,
	tv.voucher_name voucher_name ,
	tv.voucher_price voucher_price,
	tr.rating_id rating_id, 	
	tr.rating_level rating_level,
	tr.rating_status rating_status
from
	tb_orders to2
inner join tb_users tu 
on
	to2.user_id = tu.user_id
inner join tb_vouchers tv  
on
	tu.user_id = tv.user_id
inner join tb_payments tp 
on
	to2.payment_id = tp.payment_id
inner join tb_order_items toi 
on
	toi.order_id = to2.order_id
inner join tb_products tp2 
on
	tp2.product_id = toi.product_id
inner join tb_product_category tpc  
on
	tpc.product_category_id = tp2.product_category_id
inner join tb_shippers ts 
on
	ts.shipper_id = to2.shipper_id
inner join tb_ratings tr  
on
	tr.rating_id = to2.rating_id; 