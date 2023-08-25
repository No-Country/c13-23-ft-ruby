class Account < ApplicationRecord
  belongs_to :business
  has_many :movements
end
