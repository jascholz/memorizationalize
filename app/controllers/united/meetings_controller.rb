class United::MeetingsController < United::BaseController

  def index
    @slots = United::Slot.where('day >= ? AND day <= ?', Date.today.beginning_of_week, Date.today.end_of_week)

    @user = current_user

    @slots.each do |slot|
      if @user.slots.find_by(id: slot.id).nil?
        @user.slots.build(slot_id: slot.id)
      end
    end
  end

end
