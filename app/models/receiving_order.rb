class ReceivingOrder < ApplicationRecord
  # relation
  belongs_to :item
  belongs_to :client
  belongs_to :worker

  # validation
  with_options presence: true do
    validates :slip_no, numericality: { only_integer: true }
    validates :order_date
    validates :quantity, numericality: { only_integer: true }
    validates :status
  end

  validates :notes, length: { maximum: 100 }

  # enum
  enum status: { '発行済み': 1, '受注(在庫無)': 2, '発注済み': 3 }

  # ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    ["slip_no", "order_date", "quantity", "notes"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["client", "item"]
  end
end
