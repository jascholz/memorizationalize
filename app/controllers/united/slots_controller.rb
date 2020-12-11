class United::SlotsController < United::BaseController

  def new
    build_slot
  end

  def edit
    load_slot
    build_slot
  end

  def create
    build_slot
    save_slot
  end

  def update
    load_slot
    build_slot
    save_slot
  end

  def destroy
    load_slot
    @slot.destroy
    redirect_to united_path
  end

  private

  def build_slot
    @slot ||= United::Slot.new
    @slot.attributes = slot_params
  end

  def load_slot
    @slot ||= United::Slot.find(params[:id])
  end

  def save_slot
    if @slot.save
      redirect_to united_path
    else
      render 'new'
    end
  end

  def slot_params
    slot_params = params[:united_slot]&.permit([
      :description,
      :start_time,
      :end_time,
      :day,
    ])

    slot_params || {}
  end

end
