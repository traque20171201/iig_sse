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
make init-data (sudo make init-data)

Step 4: Run lệnh
make seed-fu (sudo make seed-fu)

Stp 5: Test
Truy cập link: localhost:3000 để xác nhận hệ thống được setup thành công

Step 6: Fix error webpacker nếu khi test bị lỗi Run lệnh make fix-webpacker (sudo make fix-webpacker)

II. Hướng dẫn update hệ thống
Step 1: Vào thư mục source code lưu trên server
Run lệnh: cd thư mục lưu source code (ex: home/dev/project/iig_sse)

Step 2: Run lệnh
git pull origin develop

Step 3: Run lệnh
make stop (sudo make stop)

Step 4: Run lệnh
make up (sudo make up) Chú ý nếu hiển thị log thì tắt terminal bằng dấu X - Không tắt terminal bằng crtl + c

HẾT.
