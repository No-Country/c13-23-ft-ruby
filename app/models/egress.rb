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
<<<<<<< HEAD
  monetize :balance_cents


=======
  validate_of_presence :account_id, :balance_cents
>>>>>>> e541ab2ac350343ed4c40f38132d91173d26793c
end
