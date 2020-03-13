class UnitedController < ApplicationController
  layout 'plain'

  skip_before_action :require_login, except: [:edit, :update_game]
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
  end

  def update_game
    @game = United::Game.last
    @game.attributes = params[:united_game].permit([:state_event])
    @game.save
    redirect_to edit_game_united_path
  end

  def game
    game = United::Game.active.last
    if game
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
    if current_user
      @united_user = current_user.name
    else
      @united_user = cookies.encrypted[:united_user]
    end

    if @united_user.nil?
      redirect_to new_united_user_path
    end
  end

  def init
    @header_title = 'United'
    @header_path = united_path
  end

end
