# == Schema Information
#
# Table name: businesses
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  name_busines :string
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
