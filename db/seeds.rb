# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.create!(
  [
    {
      name: 'ケーキ',
    },
    {
      name: '焼き菓子',
    },
    {
      name: 'プリン',
    },
    {
      name: 'キャンディ',
    }
  ]
)

Item.create!(
  [
    {
      genre_id: 1,
      name: 'チーズケーキ',
      introduction: '新商品！',
      price: 500,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 2,
      name: 'マカロン',
      introduction: '新商品！',
      price: 300,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 3,
      name: 'なめらかプリン',
      introduction: '新商品！',
      price: 400,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 4,
      name: '生キャラメル',
      introduction: '新商品！',
      price: 200,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 1,
      name: 'チェリータルト',
      introduction: '新商品！',
      price: 500,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 2,
      name: 'クッキーアソート',
      introduction: '新商品！',
      price: 1000,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 3,
      name: 'かぼちゃプリン',
      introduction: '新商品！',
      price: 400,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    },
    {
      genre_id: 4,
      name: '千歳飴',
      introduction: '新商品！',
      price: 100,
      is_active: true,
      #image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images"), filename:"no_image.jpg")
    }
  ]
)
