class Note < ApplicationRecord
  include Shared::DoesEntry

  before_validation :randomize_post_it

  scope :ordered, -> { order(updated_at: :desc) }

  def to_s
    name
  end

  private

  def randomize_post_it
    return if post_it_x && post_it_y && post_it_angle

    self.post_it_x = rand(100)
    self.post_it_y = rand(100)
    self.post_it_angle = rand(40) - 20
    self.post_it_flipped = [true, false].sample
  end
end
