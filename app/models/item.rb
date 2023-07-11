class Item < ApplicationRecord
  # validations
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :price, numericality: { only_integer: true, in: 300..99999 }
  end
end