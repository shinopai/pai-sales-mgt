class Client < ApplicationRecord
  # relation
  has_many :receiving_orders, dependent: :destroy

  # validations
  validates :name, presence: true,
                   length: { maximum: 50 }
end
