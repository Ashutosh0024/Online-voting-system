class CandidatesController < ApplicationController
	def index
    @candidates = Candidate.all
    @voter = Voter.find(params[:voter_id]) if params[:voter_id].present?
  end

  def show
    @candidates = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create
    if Candidate.create!(candidate_params)
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update(candidate_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    redirect_to action: "index"
  end

  def vote
    @candidate = Candidate.find(params[:id])
    @candidate.update(vote_count: @candidate.vote_count+1)
    redirect_to root_path
  end

  private
    def candidate_params
      params.require(:candidate).permit(:firstname, :lastname, :gender, :email, :phone, :dob, :address1, :address2, :state, :city, :pin, :aadhar_number, :party)
    end
end
