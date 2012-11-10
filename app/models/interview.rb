class Interview < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :candidate
end
