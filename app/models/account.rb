# == Schema Information
#
# Table name: accounts
#
#  id            :bigint           not null, primary key
#  balance_cents :integer          default(0)
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  business_id   :bigint           not null
#
# Indexes
#
#  index_accounts_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
class Account < ApplicationRecord
  belongs_to :business
  has_many :movements, dependent: :destroy
  validates :name, presence: true
  validates :balance, presence: true
  monetize :balance_cents
end
