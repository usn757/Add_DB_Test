# 1. 30세 이상 사용자의 이름과 이메일을 조회하세요.
SELECT username, email
FROM users
WHERE age >= 30;

# 2. 평균 상품 가격보다 비싼 상품의 이름과 가격을 조회하세요.
SELECT product_name, price
FROM products
where price >= (
    SELECT avg(price)
    FROM products
);

# 3. JohnDoe 사용자가 주문한 상품의 이름과 수량을 조회하세요.
select p.product_name, o.quantity
from orders o
join products p on o.product_id = p.product_id
where user_id = (
    select u.user_id
    from users u
    where username = 'JohnDoe'
);


# 4. 별점 4점 이상인 리뷰의 상품 이름과 리뷰 내용을 조회하세요.
select p.product_name, r.comment
from reviews r
join products p on p.product_id = r.product_id
where rating >= 4;

# 5. 카테고리별 상품 수를 조회하세요.
select category, count(category) as totalCount
from products
group by category;

# 6. 가장 많이 팔린 상품의 이름과 판매 수량을 조회하세요.
select p.product_name, o.quantity
from products p
join (
    select product_id, sum(quantity) as quantity
    from orders
    group by product_id
    order by sum(quantity) desc
    limit 1
) o on p.product_id = o.product_id;

# 7. 사용자별 총 주문 금액을 조회하세요.
select username, sum(price * quantity)
from orders
join users using (user_id)
join products using (product_id)
group by user_id;

# 8. 평균 별점이 4점 이상인 상품의 이름과 평균 별점을 조회하세요.

select product_name, avg(rating)
from reviews
join products using(product_id)
group by product_id
HAVING avg(rating) >= 4;

# 9. 상품별 리뷰 수를 조회하고, 리뷰 수가 2개 이상인 상품만 조회하세요.
select product_name
from reviews
join products using(product_id)
group by product_id having count(review_id) >= 2;

# 10. T-shirt를 구매한 사용자의 이름과 이메일을 조회하세요.

select username, email
from orders
join users using(user_id)
where product_id = (
    select product_id
    from products
    where product_name = 'T-shirt'
);


