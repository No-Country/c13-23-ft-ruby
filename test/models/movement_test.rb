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
require "test_helper"

class MovementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
