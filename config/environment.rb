# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html_tag.insert(html_tag.index('class') + 7, 'form--errors ').html_safe
end
