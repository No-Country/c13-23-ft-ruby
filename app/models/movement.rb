class Movement < ApplicationRecord
  belongs_to :accounts
  has_one :business, through: :accounts
end
