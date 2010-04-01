class AdminController < ApplicationController
  before_filter :require_user
  
  def index
    @top_subdomains_today = Subdomain.top_today
    @top_sites_today = Site.top_today
    @top_referrers_today = Hit.top_referrers_today
  end
end
