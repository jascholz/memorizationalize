class Idea < ApplicationRecord
  include Shared::DoesEntry

  def to_s
    name
  end
  
end
