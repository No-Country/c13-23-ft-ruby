# == Schema Information
#
# Table name: businesses
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  name_busines :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Business < ApplicationRecord
  belongs_to :user
  has_many :accounts
  has_many_attached :photos
end
