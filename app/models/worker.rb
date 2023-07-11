class Worker < ApplicationRecord
  # validations
  validates :name, presence: true,
                   length: { maximum: 30 }
end
