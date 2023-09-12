# == Schema Information
#
# Table name: accounts
#
#  id          :bigint           not null, primary key
#  balance     :integer
#  currency    :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_accounts_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
