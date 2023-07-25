# 従業員テストデータ
# 50.times do
# Worker.create(
#   name: Faker::Name.name
# )
# end

# 受注先テストデータ
# 250.times do
# Client.create(
#   name: Faker::Company.name
# )
# end

# require 'securerandom'

# # 在庫商品テストデータ
# 3500.times do
# Item.create(
#   name: Faker::Commerce.product_name,
#   price: Faker::Number.between(from: 300, to: 99999),
#   code: '83' + SecureRandom.alphanumeric(4),
#   stock: rand(0..100)
# )
# end

# 発注先テストデータ
100.times do
Supplier.create(
  name: Faker::Company.name
)
end
