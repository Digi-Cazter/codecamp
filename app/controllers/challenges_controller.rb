class ChallengesController < ApplicationController
	def index
		
	end

	def new
		respond_to do |format|
      format.js {render 'challenges/new'}
    end
	end

	def load
		@type = params[:type] rescue "Challenges"

		@challenge = Challenge.find params[:id]
		respond_to do |format|
      format.js {render 'challenges/load'}
    end
	end

	def error
		@message = "There was a problem saving your challenge."
		respond_to do |format|
      format.js {render 'layouts/alert'}
    end
	end

	def create
		if params[:id] == nil || params[:id] == ""
			@challenge = Challenge.new
			@challenge.user_id = 1
		else
			@challenge = Challenge.find params[:id]
		end

		@challenge.description = params[:description] rescue nil
		@challenge.challenge = params[:challenge] rescue nil
		@challenge.starter_code = params[:starter_code] rescue nil
		@challenge.test_case = params[:test_case] rescue nil
		@challenge.save
		@type = "Challenges"
		
		@message = "#{@challenge.description} has been saved."
    respond_to do |format|
      format.js {render 'challenges/create'}
    end
	end
end
