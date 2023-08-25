# == Schema Information
#
# Table name: movements
#
#  id          :bigint           not null, primary key
#  accounts_id :bigint           not null
#  balance     :integer
#  currency    :string
#  category    :integer
#  beneficiary :string
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Movement < ApplicationRecord
  belongs_to :accounts
  has_one :business, through: :accounts
end
