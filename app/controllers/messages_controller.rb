require 'uuid'

class MessagesController < ApplicationController
  @@default_url = "http://getthefuckoff.me/"
  
  def show
    respond_to do |format|
      if request.host =~ /((.+)\.)?(.+\..{2,3})/
        host_subdomain = $2
        host_domain = $3
      
        @site = Site.find_by_domain(host_domain)
      
        if @site
          if host_subdomain
            @name = get_name(host_subdomain)
            @message = @site.messages.random
          
            format.html
          else
            format.html { render :action => "index" }
          end
        else
          redirect_to @@default_url
        end # @site
      else
        redirect_to @@default_url
      end # request.host
    end # respond_to
  end # show
  
  private
    def get_name(subdomain)
      subdomain.gsub(/[\._]/, " ").titlecase
    end
    
    def record_hit(site)
      cookies[:uuid] = {:value => UUID.new.generate, :domain => site.domain, :expires => 1.year.from_now} unless cookies[:uuid]
        
      Hit.create(:site => site, :uuid => cookies[:uuid], :referrer => request.referrer, :remote_ip => request.remote_ip, :user_agent => request.user_agent)
    end
end
