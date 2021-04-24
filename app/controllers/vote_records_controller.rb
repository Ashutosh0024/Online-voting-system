class VoteRecordsController < ApplicationController

  def create
    VoteRecord.create(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    render 'pages/thank_you.html.erb'
  end

  private

  def vote_record_params
    params.require(:vote_record).permit(:voter_id, :candidate_id)
  end

end
