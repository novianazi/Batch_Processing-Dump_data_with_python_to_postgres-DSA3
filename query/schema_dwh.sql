DROP TABLE IF EXISTS dim_users;
CREATE TABLE dim_users (
	user_id INT NOT NULL,
	user_first_name VARCHAR(255) NOT NULL,
	user_last_name VARCHAR(255) NOT NULL,
	user_gender VARCHAR(50) NOT NULL,
	user_address VARCHAR(255),
	user_join DATE NOT NULL
	);	

DROP TABLE IF EXISTS fact_orders;
CREATE TABLE fact_orders (
	user_id INT NOT NULL,	
	user_first_name VARCHAR(255) NOT NULL,
	user_last_name VARCHAR(255) NOT NULL,
	order_id INT NOT NULL,
	order_date DATE NOT NULL,
	order_price INT NOT NULL,
	order_discount INT,	
	order_item_id INT NOT NULL,
	product_id INT NOT NULL,
	product_category_id INT NOT NULL,
	product_category_name VARCHAR(255) NOT NULL,
	product_name VARCHAR(255) NOT NULL,
	product_price INT NOT NULL,
	product_discount INT,
	order_item_quantity INT,
	product_subdiscount INT,
	product_subprice INT NOT NULL,
	order_total INT NOT NULL,	
	payment_id INT NOT NULL,
	payment_name VARCHAR(255) NOT NULL,
	payment_status BOOLEAN NOT NULL,
	shipper_id INT NOT NULL,
	shipper_name VARCHAR(255) NOT NULL,
	voucher_id INT,
	voucher_name VARCHAR(255) NOT NULL,
	voucher_price INT,
	rating_id INT NOT NULL, 	
	rating_level INT NOT NULL,
	rating_status VARCHAR(255) NOT NULL
);