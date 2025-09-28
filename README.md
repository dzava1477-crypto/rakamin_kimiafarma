# rakamin_kimiafarma
1. Persiapan Lingkungan
   - Membuat project di Google Cloud Platform dan dataset kimia_farma di BigQuery.
2. Import Data
   - Mengunggah 4 dataset (kf_final_transaction, kf_inventory, kf_kantor_cabang, kf_product) ke BigQuery.
3. Data Transformation (SQL)
   - Menulis query BigQuery SQL untuk:
     - Join seluruh tabel.
     - Hitung kolom turunan: nett_sales, nett_profit, persentase_gross_laba.
    - Menyimpan query final sebagai tabel_analisa.sql.
4. Dashboard
   - Menghubungkan tabel tabel_analisa ke Google Looker Studio.
   - Mendesain dashboard berisi:
     - Summary & filter tahun/provinsi
     - Grafik pendapatan 2020–2023
     - Top 10 provinsi transaksi & nett sales
     - Top 5 cabang rating tertinggi vs rating transaksi terendah
     - Geo Map total profit per provinsi.
5. Publikasi
   - Menyimpan query .sql, screenshot dashboard, dan dokumentasi ke GitHub.
