class Api::V1::CandidatesController

  def index
	  render json: Candidates.all
  end

  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  private def candidate_params
    params.require(:candidate).permit(:name, :party)
  end

end
