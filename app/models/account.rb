# == Schema Information
#
# Table name: accounts
#
#  id          :bigint           not null, primary key
#  business_id :bigint           not null
#  name        :string
#  balance     :integer
#  currency    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Account < ApplicationRecord
  belongs_to :business
  has_many :movements
end
