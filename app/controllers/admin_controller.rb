class AdminController < ApplicationController
  before_filter :require_user
  
  def index
    @top_subdomains_today = Subdomain.find(:all, :limit => 10, :order => "views_today DESC", :conditions => "views_today > 0", :include => "site")
  end
end
