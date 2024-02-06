# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.create!(
    last_name: "テスト",
    first_name: "テスト",
    last_name_kana: "テスト",
    first_name_kana: "テスト",
    postal_code: "111111",
    address: "テスト県テスト市",
    telephone_number: "1111111111",
    email: "test@test",
    password: "password"
)

Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Genre.create!(
    [
        {name: "ケーキ"},
        {name: "プリン"},
        {name: "焼き菓子"},
        {name: "キャンディ"}
    ]
    )

Item.create!(
    [
        {
            genre_id: 1,
            name: "洋梨のチーズタルト",
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/images/1.jpg")), filename: '1.jpg'),
            introduction: "山形県産の洋梨を贅沢に使用しています。",
            price: 1200,
            is_active: true
        },
        {
            genre_id: 1,
            name: "ザッハトルテ",
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/images/2.jpg")), filename: '2.jpg'),
            introduction: "しっとりとしたチョコレート生地に、アプリコットジャムをサンドしています。",
            price: 2900,
            is_active: true
        },
        {
            genre_id: 1,
            name: "モンブラン",
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/images/3.jpg")), filename: '3.jpg'),
            introduction: "静岡県掛川産の栗を贅沢に使用しています。",
            price: 500,
            is_active: true
        },
        {
            genre_id: 2,
            name: "卵たっぷり濃厚プリン",
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/images/4.jpg")), filename: '4.jpg'),
            introduction: "原料にこだわった、濃厚でなめらかな舌触りのプリンです。",
            price: 500,
            is_active: true
        },
        {
            genre_id: 3,
            name: "紅茶のクッキー",
            image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("db/images/5.jpg")), filename: '5.jpg'),
            introduction: "バターをたっぷり使用したしっとりとしたクッキーに、アールグレイ茶葉を練り込んだ、香り豊かな紅茶クッキーです。",
            price: 800,
            is_active: true
        }
    ]
    )