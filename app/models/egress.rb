# == Schema Information
#
# Table name: movements
#
#  id          :bigint           not null, primary key
#  balance     :integer
#  beneficiary :string
#  category    :integer
#  currency    :string
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  accounts_id :bigint           not null
#
# Indexes
#
#  index_movements_on_accounts_id  (accounts_id)
#
# Foreign Keys
#
#  fk_rails_...  (accounts_id => accounts.id)
#
class Egress < Movement
  belongs_to :movements
end
