# == Schema Information
#
# Table name: notifications
#
#  id            :bigint           not null, primary key
#  balance_cents :decimal(, )      default(0.0)
#  currency      :string
#  date          :date
#  name          :string
#  note          :text
#  status        :integer          default("active")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  business_id   :bigint           not null
#
# Indexes
#
#  index_notifications_on_business_id  (business_id)
#
# Foreign Keys
#
#  fk_rails_...  (business_id => businesses.id)
#
class Notification < ApplicationRecord
  belongs_to :business
  enum status: { active: 0, expired: 1 }
  monetize :balance_cents, as: :balance
end
