class Candidate < ActiveRecord::Base
  has_many :interviews

  def full_name
  	self.first_name + " " + self.last_name
  rescue NoMethodError
    return ""
  end
end
