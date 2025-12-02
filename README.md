# terminal-fardan
# Tugas Praktik Akhir Database (CMD + MySQL)
Nama Database: terminal  
Dikerjakan oleh: fardan maulana aziz

## Isi Repository
- terminal_full.sql → Script SQL lengkap (create, insert, update, delete, trigger)
- terminal.sql → File hasil mysqldump
- screenshot/
  - login_mysql.png
  - create_table.png
  - insert_data.png
  - select_output.png
  - update_output.png
  - delete_output.png
  - dump_command.png

## Cara Menjalankan
1. Buka CMD
2. Jalankan:
   mysql -u root -p < terminal_full.sql
3. Untuk melihat tabel:
   USE terminal;
   SHOW TABLES;

## Perintah Penting
- Update data:
  UPDATE penumpang SET boarding='19:00' WHERE nama_depan='Sri';
- Delete data:
  DELETE FROM penumpang WHERE nama_belakang='Salma';

## Ekspor Database
jalankan:
mysqldump -u root -p terminal > terminal.sql

## Catatan
- Semua pengerjaan dilakukan via CMD
- Trigger otomatis mengurangi pekerjaan manual
