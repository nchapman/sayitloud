class Site < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  has_many :hits, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
  
  validates_presence_of :name, :domain
end
