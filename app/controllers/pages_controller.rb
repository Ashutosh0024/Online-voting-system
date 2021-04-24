class PagesController < ApplicationController

  def home
  end

  def result
  	@candidates =  Candidate.all
  	@winner = Candidate.order(:vote_count).last
  end

end
