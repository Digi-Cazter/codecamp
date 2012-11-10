class DashboardController < ApplicationController
  def index
  	start = Time.now.to_s.split(" ")[0]
    @schedule_list = Interview.where("user_id = 1 AND schedule_date > '#{start} 00:00:00' AND schedule_date < '#{start} 23:59:59'")
  end
end
