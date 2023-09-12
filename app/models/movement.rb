# == Schema Information
#
# Table name: movements
#
#  id            :bigint           not null, primary key
#  balance_cents :integer          default(0)
#  beneficiary   :string
#  category      :integer
#  note          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  accounts_id   :bigint           not null
#
# Indexes
#
#  index_movements_on_accounts_id  (accounts_id)
#
# Foreign Keys
#
#  fk_rails_...  (accounts_id => accounts.id)
#
class Movement < ApplicationRecord
  belongs_to :accounts
  has_one :business, through: :accounts
end
