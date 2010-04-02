class Hit < ActiveRecord::Base
  belongs_to :site
  belongs_to :subdomain
  
  validates_presence_of :uuid
  
  def self.top_referrers_today
    today = Date.today.to_formatted_s(:db)
    tomorrow = (Date.today + 1).to_formatted_s(:db)
    
    self.find_by_sql("SELECT referrer, COUNT(DISTINCT uuid) AS count FROM hits WHERE created_at > '#{today}' AND created_at < '#{tomorrow}' GROUP BY referrer")
  end
  
  def self.visitor_count_by_hour
    result = self.find_by_sql("SELECT HOUR(CONVERT_TZ(created_at, '+00:00','-07:00')) AS hour, COUNT(DISTINCT uuid) as count FROM hits WHERE created_at > (NOW() - INTERVAL 1 DAY) GROUP BY HOUR(created_at)")
  
    map = {}
    
    result.each { |r| map[r.hour.to_i] = r.count.to_i }
    
    return map
  end
  
  def self.hit_count_by_hour
    result = self.find_by_sql("SELECT HOUR(CONVERT_TZ(created_at, '+00:00','-07:00')) AS hour, COUNT(uuid) as count FROM hits WHERE created_at > (NOW() - INTERVAL 1 DAY) GROUP BY HOUR(created_at)")
  
    map = {}
    
    result.each { |r| map[r.hour.to_i] = r.count.to_i }
    
    return map
  end
end
