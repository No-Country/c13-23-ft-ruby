class Notification < ApplicationRecord
  belongs_to :business
  enum status: { active: 0, expired: 1 }
end
