# == Schema Information
#
# Table name: movements
#
#  id            :bigint           not null, primary key
#  balance_cents :decimal(, )      default(0.0)
#  beneficiary   :string
#  category      :integer
#  currency      :string
#  note          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :bigint           not null
#
# Indexes
#
#  index_movements_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
class Egress < Movement
  # belongs_to :movements
  validates_presence_of :account_id, :balance_cents
  monetize :balance_cents, as: :balance
end
