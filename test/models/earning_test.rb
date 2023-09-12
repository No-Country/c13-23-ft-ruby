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
#  account_id  :bigint           not null
#
# Indexes
#
#  index_movements_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require "test_helper"

class EarningTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
