# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
            introduction: "山形県産の洋梨を贅沢に使用しています。",
            price: 1200
        },
        {
            genre_id: 1,
            name: "ザッハトルテ",
            introduction: "しっとりとしたチョコレート生地に、アプリコットジャムをサンドしています。",
            price: 2900
        },
        {
            genre_id: 1,
            name: "モンブラン",
            introduction: "静岡県掛川産の栗を贅沢に使用しています。",
            price: 500
        },
        {
            genre_id: 2,
            name: "卵たっぷり濃厚プリン",
            introduction: "原料にこだわった、濃厚でなめらかな舌触りのプリンです。",
            price: 500
        },
        {
            genre_id: 3,
            name: "紅茶のクッキー",
            introduction: "バターをたっぷり使用したしっとりとしたクッキーに、アールグレイ茶葉を練り込んだ、香り豊かな紅茶クッキーです。",
            price: 800
        }
    ]
    )