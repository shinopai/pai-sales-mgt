class Item < ApplicationRecord
  # relation
  has_many :receiving_orders, dependent: :destroy

  # validations
  with_options presence: true do
    validates :name, length: { maximum: 30 }
    validates :price, numericality: { only_integer: true, in: 300..99999 }
  end

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name", "stock"]
  end
end
