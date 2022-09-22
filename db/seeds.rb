# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  20.times do |n|
    Customer.create!(
      email: "test#{n + 1}@test.com",
      last_name: "太郎#{n + 1}",
      first_name: "てすと#{n + 1}",
      last_name_kana: "タロウ#{n + 1}",
      first_name_kana: "テスト#{n + 1}",
      postal_code: "111#{n + 1}",
      password: "aaa111#{n + 1}",
      address: "日本#{n + 1}",
      telephone_number: "0120000#{n + 1}",
      is_deleted: false,
    )
  end

Admin.create!(
   email: 'bonboncho!@test.com',
   password: 'momotako',
)

  5.times do |n|
    Genre.create!(
      name: "Bon#{n + 1}",
    )
  end

  20.times do |n|
    Item.create!(
      genre_id: 1,
      name: "BonBonケーキ#{n + 1}",
      introduction: "真心こめて作りました💛#{n + 1}",
      price: "893",
      is_active: false,
    )
  end