class AdminController < ApplicationController

  def index
    load_klasses
  end

  private

  def load_klasses
    Rails.application.eager_load!
    @klasses = ApplicationRecord.descendants.collect(&:name).compact.collect(&:constantize)
  end

end
