class User < ActiveRecord::Base
  acts_as_authentic
  
  validates_presence_of :first_name, :last_name
  
  @@per_page = 25
  cattr_reader :per_page
end
