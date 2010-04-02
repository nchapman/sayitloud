class AdminController < ApplicationController
  before_filter :require_user
  
  def index
    @top_subdomains_today = Subdomain.top_today
    @top_sites_today = Site.top_today
    @top_referrers_today = Hit.top_referrers_today
    
    @visitor_count_by_hour = Hit.visitor_count_by_hour
    @hit_count_by_hour = Hit.hit_count_by_hour
    
    @hours = []
    @visitor_counts = []
    @hit_counts = []
    now = DateTime.now
    
    (0..23).each do |i|
      time = now - i.hours
      
      @hours << (i % 2 == 0 ? time.strftime("%I%p").sub(/^0/, "").sub(/M$/, "") : "")
      @visitor_counts << (@visitor_count_by_hour.has_key?(time.hour) ? @visitor_count_by_hour[time.hour] : 0)
      @hit_counts << (@hit_count_by_hour.has_key?(time.hour) ? @hit_count_by_hour[time.hour] : 0)
    end
    
    @hours.reverse!
    @visitor_counts.reverse!
    @hit_counts.reverse!
    
    @visitor_chart = Gchart.line(:data => [@visitor_counts, @hit_counts], :legend => ["Visitors", "Visits"], :size => '625x250', :theme => :keynote, :axis_with_labels => 'x,y', :axis_labels => [@hours.join("|"), "0|#{@hit_counts.max}"], :bg => 'fff', :max_value => @hit_counts.max)
  end
end
