class InterviewsController < ApplicationController
  def index
  end

  def add_to_queue
    @interview = Interview.find params[:id]
    item = InterviewChallenge.new
    item.interview_id = params[:id]
    item.challenge_id = params[:challenge] rescue nil
    item.created_at = Time.now.to_s(:db)
    item.save

    @message = "#{item.challenge.description} has been added to your challenge queue."
    
    respond_to do |format|
      format.js {render 'interviews/load_queue'}
    end
  end

  def error
    @message = "There was a problem scheduling your interview."
    respond_to do |format|
      format.js {render 'layouts/alert'}
    end
  end

  def show
    @interview = Interview.find params[:id]
  end

  def new
    respond_to do |format|
      format.js {render 'interviews/new'}
    end
  end

  def create
    candidate = Candidate.new
    candidate.first_name = params[:name]
    candidate.user_id = 1
    candidate.save

    interview = Interview.new
    interview.candidate_id = candidate.id

    if params[:date] != ""
      split = params[:date].split(" ")
      date = split[0].split("/")
      time = split[1]
      day = date[0]
      month = date[1]
      year = date[2]

      final = "#{year}-#{day}-#{month} #{time}:00"

      interview.schedule_date = final
    end

    x = params["candidate"][:position]
    logger.debug x
    interview.position = x
    interview.user_id = 1
    interview.created_at = Time.now.to_s(:db)
    interview.save

    start = Time.now.to_s.split(" ")[0]
    @schedule_list = Interview.where("user_id = 1 AND schedule_date > '#{start} 00:00:00' AND schedule_date < '#{start} 23:59:59'")
    @overlay = "overlay_scheduler"
    @message = "Interview with #{params[:name]} has successfully been scheduled."
    respond_to do |format|
      format.js {render 'interviews/change_schedule'}
    end
  end

  def destroy
    interview = Interview.find params[:id]
    @message = "#{interview.candidate.name} was removed from your schedule."
    interview.destroy
    
    respond_to do |format|
      format.js {render 'layouts/notice'}
    end
  end

  def change_schedule
    split_date = params[:start].split("/")
    start = split_date[2] + "-" + split_date[0] + "-" + split_date[1]
    @schedule_list = Interview.where("user_id = 1 AND schedule_date > '#{start} 00:00:00' AND schedule_date < '#{start} 23:59:59'")
  end

  def edit
  end

  def delete
  end

  def update
  end
end
