class Client < ApplicationRecord
  # relation
  has_many :receiving_orders, dependent: :destroy

  # validations
  validates :name, presence: true,
                   length: { maximum: 50 }

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
