class VotersController < ApplicationController
  def index
    @voters = Voter.all
  end

  def show
    @voters = Voter.find(params[:id])
  end

  def new
    @voter = Voter.new
  end

  def create
    if Voter.create!(voter_params)
      redirect_to action: "index"
    else
      render :new
    end
  end

  def edit
    @voter = Voter.find(params[:id])
  end

  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def destroy
    @voter = Voter.find(params[:id])
    @voter.destroy

    redirect_to action: "index"
  end

  def login
  end

  def authorize
    voter = Voter.find_by(voter_id: params[:voter_id])
    vote_record = VoteRecord.find_by(voter_id: voter.id) if voter.present?
    if voter.present? && !vote_record.present?
      redirect_to candidates_url(voter_id: voter.id)
    else
      flash[:error] = "Invalid Voter ID or You have already Casted your Vote"
      render 'login'
    end

  end

  private
    def voter_params
      params.require(:voter).permit(:firstname, :lastname, :email, :phone, :dob,
                                    :address1, :address2, :state, :city, :pin, :gender,
                                    :aadhar_number, :voter_id)
    end
end
