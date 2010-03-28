class Message < ActiveRecord::Base
  belongs_to :site
  
  validates_presence_of :body
end
