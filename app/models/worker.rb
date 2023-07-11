class Worker < ApplicationRecord
  # relation
  has_many :receiving_orders, dependent: :destroy

  # validations
  validates :name, presence: true,
                   length: { maximum: 30 }
end
