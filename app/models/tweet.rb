class Tweet < ActiveRecord::Base
  belongs_to :site
  
  def self.update_from_twitter
    Site.all.each do |site|
      search = Twitter::Search.new(site.domain)
      last_tweet = site.tweets.last
      
      search.since(last_tweet.twitter_id) if last_tweet
      
      search.each do |r|
        unless Tweet.find_by_twitter_id(r[id])
          site.tweets.create(
            :twitter_id => r["id"],
            :user => r["from_user"],
            :profile_image_url => r["profile_image_url"],
            :body => CGI.escapeHTML(r["text"]),
            :originally_created_at => r["created_at"]
          )
        end
      end
    end
  end
  
  def url
    "http://twitter.com/#{self.user}/status/#{self.twitter_id}"
  end
end
