class MessagesController < ApplicationController
  def show
    output = "no message for you"
    
    if request.host =~ /((.+)\.)?(.+\..{2,3})/
      host_subdomain = $2
      host_domain = $3
      
      @site = Site.find_by_domain(host_domain)
      
      
      if @site
        @subdomain = @site.subdomains.find_or_initialize_by_name(host_subdomain)
        @subdomain.views_today = @subdomain.new_record? ? 1 : @subdomain.views_today + 1
        @subdomain.views_all_time = @subdomain.new_record? ? 1 : @subdomain.views_all_time + 1
        @subdomain.save
        
        if @message = @site.messages.random
          output = @site.render_message(@message, @subdomain)
        end
      end
    end

    respond_to do |format|
      format.html {
        render :text => output
      }
    end
  end
end
