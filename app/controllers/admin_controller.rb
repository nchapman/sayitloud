class AdminController < ApplicationController
  before_filter :require_user
  
  def index
    @top_subdomains_today = Subdomain.top_today
    @top_sites_today = Site.top_today
    @top_referrers_today = Hit.top_referrers_today
    
    @visitor_count_by_hour = Hit.visitor_count_by_hour
    
    @hours = []
    @counts = []
    now = DateTime.now
    
    (0..23).each do |i|
      time = now - i.hours
      
      @hours << (i % 2 == 0 ? time.strftime("%I%p").sub(/^0/, "").sub(/M$/, "") : "")
      @counts << (@visitor_count_by_hour.has_key?(time.hour) ? @visitor_count_by_hour[time.hour] : 0)
    end
    
    @hours.reverse!
    @counts.reverse!
    
    @visitor_chart = Gchart.line(:size => '600x300', :theme => :keynote, :axis_with_labels => 'x,y', :axis_labels => [@hours.join("|"), "0|25|50"],
                                  :bg => 'fff', :max_value => 50,
                                  :data => @counts)
  end
end
