require 'erubis'

class Site < ActiveRecord::Base
  has_many :messages
  has_many :subdomains
  
  validates_presence_of :name, :domain, :template
  
  def render_message(message, subdomain)
    erubis(self.template, :message => erubis(message.body, :name => subdomain.humanize))
  end
  
  def erubis(template, values)
    Erubis::Eruby.new(template).result(values)
  end
end
