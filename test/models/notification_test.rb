# == Schema Information
#
# Table name: notifications
#
#  id          :bigint           not null, primary key
#  balance     :integer          default(0)
#  date        :date
#  name        :string
#  note        :text
#  status      :integer          default("active")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  business_id :bigint           not null
#
# Indexes
#
#  index_notifications_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
