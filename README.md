# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

I. Hướng dẫn setup hệ thống

Step 1: Run lệnh

make build (sudo make build) 

Step 2: Run lệnh 

make init (sudo make init)

Step 3: Run lệnh 

make db-migrate-up (sudo make db-migrate-up)

Step 4: Run lệnh

make init-data (sudo make init-data)

Step 5: Run lệnh

make seed-fu (sudo make seed-fu)

Step 6: Run lệnh

make fix-webpacker (sudo make fix-webpacker)

Step 7: Truy cập vào link bên dưới để xác nhận hệ thống hoạt động bình thường

https://sse.iigvietnam.com/


II. Hướng dẫn upgrade hệ thống

Step 1: Run lệnh

cd ../iig_sse (thư mục lưu trữ source code ở máy host)

Step 2: Run lệnh

git pull origin master

Step 3: Run lệnh

make stop (sudo make stop)

Step 4: Run lệnh

make up (sudo make up)


III. Hướng dẫn migrate database

Step 1: Run lệnh

make db-migrate-up (sudo make db-migrate-up)

HẾT.
