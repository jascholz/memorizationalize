class UnitedController < ApplicationController
  layout 'plain'

  skip_before_action :require_login
  before_action :united_authentication
  before_action :init

  def show
    if current_user&.role == 'admin'
      redirect_to edit_game_united_path
    end
  end

  def edit_game
    @game = United::Game.last

    if @game.nil?
      @game = United::Game.seed
    end

    if @game.polling?
      @poll = @game.started_poll
      @votes = United::Vote.where(poll_id: @poll.id)
    end
  end

  def update_game
    @game = United::Game.last
    @game.attributes = params[:united_game].permit([:state_event])
    @game.save
    redirect_to edit_game_united_path
  end

  def game
    game = United::Game.active.last
    if game && current_user.confirmed?
      if game.polling?
        @poll = game.started_poll
        @vote = United::Vote.where(user: @united_user, poll_id: @poll.id).first
        render 'united/game/poll'
      elsif game.poll_results?
        @poll = game.finished_poll
        render 'united/game/poll_result'
      elsif game.finished?
        @polls = game.polls.finished
        render 'united/game/game_result'
      end
    else
      render 'united/game/wait_for_start'
    end
  end

  def finish_poll
  end

  def start_poll
  end

  private

  def united_authentication
    redirect_to new_session_path, layout: 'plain' unless user_signed_in?
  end

  def init
    current_user.touch
    @united_user = current_user.id
    @header_title = 'United'
    @header_path = united_path
  end

end
