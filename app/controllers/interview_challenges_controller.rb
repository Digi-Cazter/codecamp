class InterviewChallengesController < ApplicationController
  def destroy
    x = InterviewChallenge.find(params[:id])
    @message = "#{x.challenge.description} has been removed from your challenge queue."
    @interview = Interview.find x.interview_id
    @type = "Interview"
    x.destroy
    respond_to do |format|
      format.js {render 'interview_challenges/destroy'}
    end
  end
end