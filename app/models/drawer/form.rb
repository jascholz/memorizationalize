class Drawer::Form < ActiveType::Record[Drawer]

  before_create :build_calendar_and_gallery

  private

  def build_calendar_and_gallery
    calendars.build(creator: Power.current.user, name: 'Events')
    galleries.build(creator: Power.current.user, name: 'Images')
  end

end
