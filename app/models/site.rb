class Site < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  has_many :hits, :dependent => :destroy
  has_many :tweets, :dependent => :destroy
  
  validates_presence_of :name, :domain
  
  def top_tweets
    self.tweets.find(:all, :order => "twitter_id DESC", :limit => 5)
  end
  
  def top_hits
    Hit.find_top_by_site(self)
  end
end
