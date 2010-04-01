require 'uuid'

class MessagesController < ApplicationController
  def show
    cookies[:uuid] = UUID.new.generate unless cookies[:uuid]
    
    output = "no message for you"
    
    if request.host =~ /((.+)\.)(.+\..{2,3})/
      host_subdomain = $2
      host_domain = $3
      
      site = Site.find_by_domain(host_domain)
      
      if site
        subdomain = site.subdomains.find_or_create_by_name(host_subdomain)
        
        Hit.create(:site => site, :subdomain => subdomain, :uuid => cookies[:uuid], :referrer => request.referrer, :remote_ip => request.remote_ip)
        
        if message = site.messages.random
          output = site.render_message(message, subdomain)
        end
      end
    end

    respond_to do |format|
      format.html { render :text => output }
    end
  end
end
