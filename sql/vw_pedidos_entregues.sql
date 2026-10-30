CREATE OR REPLACE VIEW vw_pedidos_entregues AS
WITH avaliacao AS (
    SELECT DISTINCT ON (order_id)
        order_id,
        review_score
    FROM order_reviews
    ORDER BY order_id, review_answer_timestamp DESC   -- mantém a mais recente
)
SELECT
    o.order_id,
    c.customer_unique_id,
    c.customer_state,
    o.order_purchase_timestamp,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    (o.order_delivered_customer_date::date - o.order_purchase_timestamp::date)      AS dias_entrega,
    (o.order_delivered_customer_date::date - o.order_estimated_delivery_date::date) AS dias_atraso,
    (o.order_delivered_customer_date::date > o.order_estimated_delivery_date::date) AS atrasado,
    a.review_score
FROM orders o
JOIN customers c        ON c.customer_id = o.customer_id
LEFT JOIN avaliacao a   ON a.order_id = o.order_id
WHERE o.order_status = 'delivered'
  AND o.order_delivered_customer_date IS NOT NULL;