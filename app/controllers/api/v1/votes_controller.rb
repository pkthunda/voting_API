class Api::V1::VotesController < ApplicationController
  before_action :restrict_access

  def index
	  render json: Vote.all
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
     render json: @vote
    else
     render json: "Invalid parameters"
    end
  end
end
  # Never trust parameters from the scary internet, only allow the white list through.
  private

  def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id)
  end

  def restrict_access
   api_key = ApiKey.find_by_access_token(params[:access_token])
   head :unauthorized unless api_key
  end


  # def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #   ApiKey.exists?(access_token: token)
  #   end
  # end
