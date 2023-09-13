# == Schema Information
#
# Table name: businesses
#
#  id            :bigint           not null, primary key
#  description   :text
#  name_business :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_businesses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Business < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many :notifications
  has_one_attached :logo
  validates_presence_of :name_busines
  validates_uniqueness_of :name_busines
end
