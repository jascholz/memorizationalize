class United::UserSlot < ApplicationRecord
  self.table_name = 'united_user_slots'

  include Shared::DoesFlag[:available, default: false]

  belongs_to :slot, class_name: 'United::Slot'
  belongs_to :user, class_name: 'United::User', inverse_of: :slots
end
