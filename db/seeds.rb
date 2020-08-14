# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# require "csv"



# Item.create!(name: "ねこちゃん", content: "かわいい猫のぬいぐるみです。", category_id: 585, size: "S", brand: "ABC", condition: 1, postage_payer: 2, postage_type: 1, prefecture_id: 3, preparation_day: 2, price: 2000, seller_id: 1, buyer_id: 2)

# Item.create!(name: "うさちゃん", content: "かわいいウサギのぬいぐるみです。", category_id: 585, size: "", brand: "", condition: 3, postage_payer: 1, postage_type: 2, prefecture_id: 8, preparation_day: 1, price: 3000, seller_id: 1)

# Item.create!(name: "くまさん", content: "かわいいくまのぬいぐるみです。", category_id: 585, size: "", brand: "", condition: 1, postage_payer: 2, postage_type: 1, prefecture_id: 3, preparation_day: 2, price: 2000, seller_id: 1)

# Item.create!(name: "お気に入りTシャツ", content: "かわいいTシャツです", category_id: 3, size: "38", brand: "hoge", condition: 3, postage_payer: 1, postage_type: 1, prefecture_id: 3, preparation_day: 2, price: 3000, seller_id: 1)

# Item.create!(name: "冬用ニット", content: "かわいいニットです。", category_id: 11, size: "S", brand: "ABC", condition: 1, postage_payer: 2, postage_type: 1, prefecture_id: 3, preparation_day: 2, price: 2000, seller_id: 1)


# Image.create(item_id: 1, image_url: "https://tk.ismcdn.jp/mwimgs/e/b/1140/img_eb31afc9c1fb914d68a7c73b657c7ebe183087.jpg")
# Image.create(item_id: 1, image_url: "https://dol.ismcdn.jp/mwimgs/c/8/670m/img_c8dad835c4b9134b067cc8b8efcab22f143142.jpg")
# Image.create(item_id: 1, image_url: "https://tk.ismcdn.jp/mwimgs/4/2/1140/img_426e0bd27203f1ceb77bc4e435571749313985.jpg")
# Image.create(item_id: 1, image_url: "https://www.newsweekjapan.jp/stories/assets_c/2017/04/iStock-501152239b-thumb-720xauto-110669.jpg")

# Image.create(item_id: 2, image_url: "https://s3-ap-northeast-1.amazonaws.com/petpedia/upload_by_admin/pipi_rabbit_ranking_800.jpg")
# Image.create(item_id: 2, image_url: "https://dot.asahi.com/S2000/upload/2018050800051_1.jpg")
# Image.create(item_id: 2, image_url: "https://s3-ap-northeast-1.amazonaws.com/petpedia/upload_by_admin/usababy_800.jpg")

# Image.create(item_id: 3, image_url: "https://image1.shopserve.jp/sun-arrow-giftshop.com/pic-labo/teddy_melody.jpg?t=20120517141555")
# Image.create(item_id: 3, image_url: "https://img05.shop-pro.jp/PA01162/467/product/130576358.jpg?cmsp_timestamp=20190526231942")
# Image.create(item_id: 3, image_url: "https://www.sekiguchi.co.jp/wp_control/wp-content/uploads/2019/01/805747.jpg")

# Image.create(item_id: 4, image_url: "https://images-na.ssl-images-amazon.com/images/I/61euJ5Kb3RL._AC_UL1280_.jpg")
# Image.create(item_id: 4, image_url: "https://shop.r10s.jp/koufukuyasan/cabinet/item-ht/hi/hi06-01b.jpg")
# Image.create(item_id: 4, image_url: "https://storage.googleapis.com/ttrinity/_img/product/6/6896/2024316/4100804/25621636/product_img_f_25621636.jpg")

# Image.create(item_id: 5, image_url: "https://img.elleshop.jp/images/commodity/0018/item194001806401-1-3.jpg")
# Image.create(item_id: 5, image_url: "https://aquagarage.fs-storage.jp/fs2cabinet/kw0/kw00624/kw00624-m-01-dl.jpg")


# CSV.foreach('db/categories.csv') do |row|
#   Category.create!(name: row[1])
# end

