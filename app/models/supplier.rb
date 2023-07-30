class Supplier < ApplicationRecord
  # relation
  has_many :orders, dependent: :destroy

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
