CREATE OR REPLACE TABLE kimia_farma.tabel_analisa AS
SELECT
  t.transaction_id,
  t.date,
  t.branch_id,
  kc.branch_name,
  kc.kota,
  kc.provinsi,
  kc.rating AS rating_cabang,
  t.customer_name,
  p.product_id,
  p.product_name,
  p.price AS actual_price,
  t.discount_percentage,

  -- Persentase Gross Laba
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS persentase_gross_laba,

  -- Nett Sales : Harga Setelah Diskon
  p.price * (1 - t.discount_percentage / 100.0) AS nett_sales,

  -- Nett Profit : Nett Sales × Persentase Laba
  p.price * (1 - t.discount_percentage / 100.0) *
  CASE
    WHEN p.price <= 50000 THEN 0.10
    WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
    WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
    WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
    ELSE 0.30
  END AS nett_profit,

  t.rating AS rating_transaksi
FROM
  `kimia_farma.kf_final_transaction` AS t
JOIN
  `kimia_farma.kf_kantor_cabang` AS kc
  ON t.branch_id = kc.branch_id
JOIN
  `kimia_farma.kf_product` AS p
  ON t.product_id = p.product_id;