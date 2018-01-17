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
admin_user = User.create( email: 'yoo@jin.com', password: 'dbsgmlqkqh', state: true)
admin_user.add_role :admin
admin_user = User.create( email: 'aa@aa.com', password: 'asdasd', state: true)
admin_user = User.create( email: 'bb@bb.com', password: 'asdasd', state: true)
admin_user = User.create( email: 'cc@cc.com', password: 'asdasd', state: true)
admin_user = User.create( email: 'dd@dd.com', password: 'asdasd', state: true)
admin_user = User.create( email: 'ee@ee.com', password: 'asdasd', state: true)

100.times do |i|
	title = i.to_s + "번째 글입니다."
	content = i.to_s + "번째 내용입니다."
	Post.create!(title: title, content: content, user_id: 1)
end
