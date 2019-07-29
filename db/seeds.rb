# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!([{email: 'test@test'}, {password: 'aaaaaa'}])
admin = Admin.new(:email => 'test@test.com', :password => 'aaaaaa')
admin.save!


#  coding: utf-8

Genre.create(
   [
     {name: 'J-POP'},
     {name: '洋楽'},
     {name: 'K-POP'},
     {name: 'ロック/オルタナティブ'},
     {name: 'パンク/ハードコア'},
     {name: 'ビジュアル'},
     {name: 'R&B/ソウル'},
     {name: 'ヒップホップ'},
     {name: 'ダンス/ハウス/テクノ'},
     {name: 'レゲエ/スカ'},
     {name: 'EDM'}
    ]
 )

 