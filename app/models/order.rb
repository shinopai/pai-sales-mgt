class Order < ApplicationRecord
  # relation
  belongs_to :item
  belongs_to :supplier

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["order_date"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["supplier", "item"]
  end
end
