class Api::V1::VotesController
  protect_from_forgery with: :null_session

  def index
	  render json: Votes.all
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
     render json: @vote
    else
     render json: "Invalid parameters"
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id)
  end

end
