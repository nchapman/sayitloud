class Hit < ActiveRecord::Base
  belongs_to :site
  belongs_to :subdomain
  
  validates_presence_of :uuid
  
  def self.top_referrers_today
    today = Date.today.to_formatted_s(:db)
    tomorrow = (Date.today + 1).to_formatted_s(:db)
    
    self.find_by_sql("SELECT referrer, COUNT(DISTINCT uuid) AS count FROM hits WHERE created_at > '#{today}' AND created_at < '#{tomorrow}' GROUP BY referrer")
  end
end
