class United::VotesController < UnitedController

  def vote
    vote = United::Vote.where(poll_id: params[:poll_id], user: params[:user]).first
    if vote.present?
      vote.update(voted_for: params[:voted_for])
    else
      vote = United::Vote.create(
        poll: United::Poll.find(params[:poll_id]),
        user: params[:user],
        voted_for: params[:voted_for],
      )
    end

    redirect_to game_united_path
  end

end
