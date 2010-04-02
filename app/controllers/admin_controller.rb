class AdminController < ApplicationController
  before_filter :require_user
  
  def index
    @top_subdomains_today = Subdomain.top_today
    @top_sites_today = Site.top_today
    @top_referrers_today = Hit.top_referrers_today
    
    @visitor_count_by_hour = Hit.visitor_count_by_hour
    @visitor_chart = Gchart.line(:size => '600x300', :theme => :keynote, :axis_with_labels => 'y',
                                  :bg => {:color => 'fff', :type => 'gradient'},
                                  :data => @visitor_count_by_hour)
  end
end
