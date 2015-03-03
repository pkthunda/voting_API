class Api::V1::VotersController
  protect_from_forgery with: :null_session
  before_filter :restrict_access

  def create
    @voter = Voter.new(voter_params)

   if @voter.save
     render json: @voter
   else
     render json: "Invalid parameters"
  end

  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  def update
    # @voter = Voter.all

    if @voter.update(voter_params)
      render json: @voter
    else
      render json: "Invalid parameters"
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def voter_params
    params.require(:voter).permit(:name, :party)
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end

end
