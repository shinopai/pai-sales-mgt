class Order < ApplicationRecord
  # relation
  belongs_to :item
  belongs_to :supplier
  belongs_to :worker

  # validation
  with_options presence: true do
    validates :slip_no, numericality: { only_integer: true }
    validates :order_date
    validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
    validates :status
  end

  # enum
  enum status: { '発注済み': 1, 'キャンセル': 2 }

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["order_date"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["supplier", "item"]
  end
end
