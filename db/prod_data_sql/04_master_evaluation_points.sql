INSERT INTO master_evaluation_points(id,"name","order",factor,is_manager,guide,created_at,updated_at) VALUES
(1,'KHỐI LƯỢNG CÔNG VIỆC',1,0.15,false,'1. Thực hiện dưới 70% số lượng công việc được giao
2. Thực hiện được từ 70% - 90% số lượng các công việc được giao
3. Thực hiện tương đối đủ từ 90 - 100% số lượng công việc được giao
4. Thực hiện đủ 100% số lượng công việc được giao và một phần trong số những công việc thêm khác',now(),now()),
(2,'CHẤT LƯỢNG CÔNG VIỆC',2,0.20,false,'1. Kết quả công việc không đạt yêu cầu, phải làm lại nhiều lần hoặc chuyển giao cho người khác thực hiện, có thể gây ra hậu quả xấu - Thông tin cập nhật chậm, sai lệch, độ tin cậy kém
2. Kết quả hoàn thành ở mức tương đối so với yêu cầu, có 1 vài sai sót nhỏ nhưng không ảnh hưởng tới kết quả chung của Công ty - Thông tin cập nhật đáp ứng đúng yêu cầu đề ra
3. Hoàn thành công việc chính đạt yêu cầu chất lượng của người giao việc, không để xảy ra sai sót nào - Thông tin được cập nhật thường xuyên, có độ tin cậy
4. Luôn hoàn thành mọi công việc (chính và thêm) một cách an toàn, chính xác, không để xảy ra bất kỳ sai sót nào với hiệu suất, hiệu quả vượt xa yêu cầu - Mọi thông tin được cập nhật thường xuyên, độ tin cậy cao',now(),now()),
(3,'TIẾN ĐỘ THỰC HIỆN CÔNG VIỆC',3,0.20,false,'1. Dưới 70% công việc không hoàn thành đúng tiến độ mặc dù đã được nhắc nhở, ảnh hưởng xấu tới hoạt động chung của phòng ban/Công ty
2. 70% - 90% công việc hoàn thành đúng hạn, vẫn cần sự nhắc nhở
3. 90% - 100% công việc hoàn thành đúng thời hạn với rất ít sự nhắc nhở
4. Luôn hoàn thành công việc trước thời hạn hoặc tiến độ cam kết. Báo cáo tiến độ kịp thời.',now(),now()),
(4,'KIẾN THỨC CHUYÊN MÔN VÀ KỸ NĂNG NGHỀ NGHIỆP',4,0.15,false,'1. Không nắm vững kiến thức chuyên môn cần thiết, các quy định, quy trình công việc, thường xuyên cần sự hướng dẫn
- Gặp khó khăn trong việc tiếp thu kiến thức, không tiến bộ khi được đào tạo
- Không cập nhật sự thay đổi của kiến thức, kỹ năng liên quan đến công việc
2. Nắm được kiến thức, chuyên môn cần thiết, các quy định, quy trình công việc, nhưng vẫn cần sự chỉ dẫn về thêm để hoàn thành công việc.
- Có tiếp thu cơ bản khi được chỉ dẫn, đào tạo
- Có cập nhật sự thay đổi của kiến thức, kỹ năng liên quan đến công việc nhưng không đưa ra giải pháp ứng dụng
3. Nắm vững kiến thức chuyên môn, nghiệp vụ, các quy định, quy trình công việc. Có thể làm việc tốt với rất ít sự hướng dẫn chuyên môn. - Có ý thức trong việc tự học, nắm bắt nhanh khi được hướng dẫn.
- Có cập nhật sự thay đổi của kiến thức, kỹ năng liên quan đến công việc và vận dụng để đưa ra giải pháp giải quyết công việc phát sinh
4. Nắm vững kiến thức chuyên môn, nghiệp vụ. Làm việc tốt mà không cần sự chỉ dẫn về chuyên môn. Chủ động truyền đạt kiến thức cho người khác để đạt được kết chung.
- Không ngừng học hỏi, trau dồi, nâng cao trình độ.
-Liên tục chủ động cập nhật sự thay đổi của kiến thức, kỹ năng liên quan đến công việc và vận dụng hiệu quả để đưa ra giải pháp giải quyết công việc phát sinh',now(),now()),
(5,'MỨC ĐỘ TIN CẬY VÀ TRÁCH NHIỆM',5,0.05,false,'1. Không tin tưởng khi được giao việc. Thường xuyên phải nhắc nhở và cần giám sát - Thụ động trong công việc được giao, không theo sát công việc đến cùng
2. Độ tin cậy ở mức giao phó các công việc theo đúng chức năng, cần sự giám sát, chỉ đạo - Chỉ thực hiện theo đúng bổn phận
3. Được giao phó một vài công việc chính, chủ đạo với rất ít sự giám sát - Có cố gắng, tận tâm, tự giác để hoàn thành tốt công việc được giao - Lập kế hoạch công việc, bám sát công việc đến cùng
4. Luôn được tin tưởng để giao phó những trọng trách lớn mà không cần phải giám sát thực hiện - Luôn tự chủ động và nỗ lực hoàn thành tốt công việc, vì mục tiêu chung của Công ty - Có khả năng nhìn nhận trước vấn đề, lập kế hoạch hiệu quả, quản lý công việc đến cùng',now(),now()),
(6,'NHIỆT TÌNH, SÁNG KIẾN, SÁNG TẠO',6,0.05,false,'1. Không bao giờ có sáng kiến trong công việc và cần phải có sự chỉ bảo cụ thể trong công việc
2. Thỉnh thoảng có một vài đề xuất, sáng kiến nhưng mức độ áp dụng hẹp trong bộ phận hoặc phòng ban, kết quả áp dụng chưa rõ ràng, chưa đo lường được
3. Nhiệt tình đóng góp ý kiến, đề xuất, có cải tiến quy trình làm việc, có một vài giải pháp phòng ngừa rủi ro, được áp dụng ở phạm vi phòng ban và có kết quả cụ thể
4. Nhiệt tình đóng góp ý kiến, đưa ra ý tưởng mới, cải tiến quy trình làm việc, chủ động xây dựng các giải pháp phòng ngừa rủi ro và mang lại hiệu quả tích cực đến không chỉ nội bộ phòng mà đến cả hoạt động của Công ty',now(),now()),
(7,'TINH THẦN, THÁI ĐỘ LÀM VIỆC',7,0.05,false,'1. Ỷ lại, trễ nải, thoái thác trong công việc, tác phong chậm chạp, bị động; Không thường xuyên tham gia các hoạt động tập thể của Công ty
2. Chưa chủ động thực hiện công việc theo nhiệm vụ MTCV. Chỉ thực hiện khi có chỉ đạo, giao việc của cấp trên; Tham gia các hoạt động của Công ty do được yêu cầu nhưng chưa chủ động, chưa nhiệt tình
3. Thực hiện công việc được giao và theo MTCV một cách chủ động, tự giác, khoa học, hợp lý, tác phong nhanh nhẹn, tuân thủ chỉ đạo cấp trên; Thường xuyên, nhiệt tình tham gia, xây dựng các hoạt động tập thể của Công ty
4. Luôn thực hiên công việc một cách chủ động, chuyên nghiệp, linh hoạt, nghiêm túc, tự giác cao, cầu thị, tích cực, đam mê trong công việc, đem lại hiệu quả cao; Tin tưởng và có đóng góp tích cực vào định hướng phát triển của Công ty. Chủ động thực hiện các mục tiêu văn hóa công ty, có đóng góp cho việc phát triển văn hóa Công ty. Tích cực tham gia tổ chức các hoạt động của Công ty và có khả năng truyền nhiệt huyết, động lực cho mọi người.',now(),now()),
(8,'KỸ NĂNG GIAO TIẾP - HỖ TRỢ HỢP TÁC',8,0.05,false,'1. Giao tiếp, ứng xử thiếu thân thiện, xảy ra xung đột, có phản hồi không tốt từ đồng nghiệp/khách hàng. Bất hợp tác trong mọi tình huống
2. Giao tiếp, ứng xử thân thiện nhưng chỉ giao tiếp với cấp trên, cấp dưới, đồng nghiệp, khách hàng, đối tác khi có công việc, chưa xây dựng được mối quan hệ hợp tác, vẫn cần sự hỗ trợ của cấp trên trong việc giao tiếp, điều phối công việc & ngoại giao
3. Có ý thức trong việc xây dựng các mối quan hệ với cấp trên, cấp dưới, đồng nghiệp, khách hàng, đối tác giúp hỗ trợ thực hiện công việc. Giao tiếp, ứng xử tốt, thân thiện, cởi mở. Sẵn sàng hợp tác, hỗ trợ khi cần thiết
4. Chủ động trong việc xây dựng mối quan hệ đối với cấp trên, cấp dưới, đồng nghiệp, khách hàng, đối tác, giúp hỗ trợ thực hiện hiệu quả công việc và tạo tác phong chuyên nghiệp, tự tin. Chủ động hợp tác, chia sẻ kiến thức, kinh nghiệm. Sẵn sàng hỗ trợ cấp trên hoàn thành nhiệm vụ chung của phòng ban/bộ phận.',now(),now()),
(9,'TIẾT KIỆM - GIỮ GÌN TÀI SẢN VÀ VỆ SINH CHUNG',9,0.05,false,'1. Chưa có ý thức, thường xuyên bị nhắc nhở về việc tiết kiệm (tài sản, công cụ dụng cụ, điện nước…), giữ gìn vệ sinh văn phòng & có phản ứng hoặc bất hợp tác khi được nhắc nhở
2. Có ý thức về việc tiết kiệm (tài sản, công cụ dụng cụ, điện nước…), giữ gìn vệ sinh văn phòng , vẫn cần sự nhắc nhở
3. Chủ động thực hiện tốt việc tiết kiệm (tài sản, công cụ dụng cụ, điện nước…) và giữ gìn vệ sinh chung
4. Luôn nêu gương hoặc chủ động nhắc nhở người khác trong việc tiết kiệm, giữ gìn vệ sinh chung cho Công ty',now(),now()),
(10,'CHẤP HÀNH NỘI QUY-QUY ĐỊNH CÔNG TY',10,0.05,false,'1. Vi phạm ở mức độ cảnh cáo bằng văn bản trở lên hoặc có từ 5 lần vi phạm bị phạt tiền trở lên
2. Chỉ bị vi phạm ở mức độ nhắc nhở, khiển trách hoặc có từ 5 lần vi phạm vị phạt tiền trở xuống
3. Không vi phạm nội quy, quy định của Công ty.
4. Nghiêm túc thực hiện và tích cực trong việc góp ý, nhắc nhở đồng nghiệp thực hiện tốt nội quy, quy định',now(),now()),
(11,'KỸ NĂNG LẬP KẾ HOẠCH',1,0.25,true,'1. Không có kế hoạch cụ thể hoặc kế hoạch không khả thi (không nộp được kế hoạch hoặc báo cáo thực hiện kế hoạch từ 2 lần trở lên)
2. Có kế hoạch nhưng vẫn cần hướng dẫn và chỉ đạo của cấp trên để thực hiện. Có một số công việc phải xử lý gấp hoặc trễ deadline
3. Thường xuyên lập kế hoạch công việc và bám sát mục tiêu, kế hoạch mang tính khả thi cao, ít điều chỉnh
4. Kế hoạch hiệu quả và đưa ra các phương án giải quyết các vấn đề phát sinh mang tính khả thi cao',now(),now()),
(12,'KỸ NĂNG QUẢN LÝ, PHÂN CÔNG VÀ KIỂM SOÁT CÔNG VIỆC',2,0.25,true,'1. Quản lý công việc chưa tốt, phân chia công việc chưa hợp lý (chồng chéo hoặc thiếu sót, không đúng người đúng việc), không theo sát tiến trình công việc. Chưa chủ động trong việc điều hành và sử dụng nhân sự
2. Đã biết quản lý công việc, phân công và kiểm soát công việc, tuy nhiên vẫn cần phải có sự chỉ đạo và hướng dẫn thêm. Vẫn có một số vấn đề trong việc điều hành và sử dụng nhân sự
3. Quản lý, phân công và kiểm soát công việc tốt đáp ứng mục tiêu đặt ra. Điều hành và sử dụng nhân sự hiệu quả
4. Chủ động quản lý, phân công và kiểm soát chặt chẽ mọi công việc vượt mục tiêu mong đợi. Điều hành và sử dụng nhân sự đạt hiệu quả cao',now(),now()),
(13,'KỸ NĂNG XỬ LÝ VẤN ĐỀ PHÁT SINH VÀ RA QUYẾT ĐỊNH',3,0.20,true,'1. Phản ứng chậm với các vấn đề phát sinh, phụ thuộc hoàn toàn vào chỉ đạo của cấp trên
2. Tiếp nhận vấn đề phát sinh và ra quyết định ở mức cơ bản nhưng vẫn cần hướng dẫn và chỉ đạo của cấp trên
3. Có khả năng nhận định và đánh giá vấn đề. Xem xét, phân tích và đưa ra quyết định phù hợp
4. Phản ứng và ra quyết định nhanh chóng, chuẩn xác',now(),now()),
(14,'KỸ NĂNG XÂY DỰNG ĐỘI NHOM - THÚC ĐẨY, ĐỊNH HƯỚNG VÀ ĐÀO TẠO CHO NHÂN VIÊN',4,0.15,true,'1. Chưa chủ động xây dựng và phát triển cơ cấu tổ chức của phòng ban/bộ phận phù hợp với sự phát triển của Công ty. Không có sự thúc đẩy, tạo động lực và định hướng, đào tạo cho nhân viên trong quá trình làm việc. Phát sinh những vấn đề về bộ máy vận hành
2. Cần hỗ trợ trong việc xây dựng và phát triển cơ cấu tổ chức của phòng ban/bộ phận phù hợp với sự phát triển của Công ty, vận hành bộ máy. Có nhưng không thường xuyên động viên, chỉ dẫn và định hướng, đào tạo cho nhân viên.
3. Có ý thức xây dựng và phát triển cơ cấu tổ chức của phòng ban/bộ phận phù hợp với sự phát triển của Công ty. Vận hành ổn định bộ máy, thường xuyên tiếp cận, thúc đẩy và định hướng, đào tạo cho nhân viên
4. Chủ động xây dựng và phát triển cơ cấu tổ chức của phòng ban/bộ phận phù hợp với sự phát triển của Công ty. Vận hành hiệu quả bộ máy, thúc đẩy và định hướng, đào tạo cho nhân viên đem lại hiệu quả rõ rệt. Chủ động xây dựng, thực hiện và triển khai kế hoạch phát triển cán bộ nguồn.',now(),now()),
(15,'KỸ NĂNG KIỂM SOÁT RỦI RO',5,0.15,true,'1. Không tự kiểm soát được rủi ro trong công việc chuyên môn của phòng, phụ thuộc vào sự chỉ đạo của cấp trên
2. Có thể nhìn thấy một vài rủi ro trong công việc, nhưng không chủ động đề xuất giải pháp hoặc thực hiện các biện pháp phòng ngừa
3. Có khả năng nhận định và đánh giá mức độ rủi ro, tổn thất trong công việc chuyên môn của phòng. Thực hiện các biện pháp phòng ngừa và không gây tổn thất gì
4. Chủ động kiểm soát rủi ro thường xuyên trong công việc chuyên môn của phòng và có đề xuất, tham mưu cho cấp trên về rủi ro chung của công ty hoặc các bộ phận/phòng ban khác khi phối hợp',now(),now())
