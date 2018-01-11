# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 관리자 계정의 생성 및 역할지정(관리자가 생성된 후 보안상의 이유로 비밀번호는 반드시 다른 것으로 변경하기 바람.)
admin_user = User.create( email: 'yun@hee.com', password: 'asdasd', state: true)
admin_user.add_role :admin

admin_user = User.create( email: 'aa@aa', password: 'asdasd', state: true )
admin_user = User.create( email: 'bb@bb', password: 'asdasd', state: true )


#임시 contents 


 Marker.create!(user_id: 1, img: 'https://s3.ap-northeast-2.amazonaws.com/stock-mulcam/uploads/1514642221.1515698hflvtuwn.png', lat: 33.450705 , lon: 126.570677,
 	placeName:'카카오', classification:'장소', content:'제주도')

 Marker.create!(user_id: 1, img: 'https://s3.ap-northeast-2.amazonaws.com/stock-mulcam/uploads/1514642221.1515698hflvtuwn.png', lat: 33.450936, lon: 126.569477,
 	placeName:'생태연못', classification:'장소', content:'제주도')
 
 Marker.create!(user_id: 1, img: 'https://s3.ap-northeast-2.amazonaws.com/stock-mulcam/uploads/1514642221.1515698hflvtuwn.png', lat: 33.450879, lon: 126.569940,
 	placeName:'텃밭', classification:'장소', content:'제주도')
 
 Marker.create!(user_id: 1, img: 'https://s3.ap-northeast-2.amazonaws.com/stock-mulcam/uploads/1514642221.1515698hflvtuwn.png', lat: 33.451393, lon: 126.570738,
 	placeName:'근린공원', classification:'장소', content:'제주도')

 100.times do |i| 
 	Post.create!(title: "aa" , content: "bb")
 end
 