class Client < ApplicationRecord
  # validations
  validates :name, presence: true,
                   length: { maximum: 50 }
end
