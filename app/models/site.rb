require 'erubis'

class Site < ActiveRecord::Base
  has_many :messages, :dependent => :destroy
  has_many :subdomains, :dependent => :destroy
  has_many :hits, :dependent => :destroy
  
  validates_presence_of :name, :domain, :template
  
  def render_message(message, subdomain)
    erubis(self.template, :name => subdomain.humanize, :message => erubis(message.body, :name => subdomain.humanize))
  end
  
  def erubis(template, values)
    Erubis::Eruby.new(template).result(values)
  end
  
  def self.top_today
    Site.find_by_sql("SELECT *, (SELECT COUNT(DISTINCT uuid) FROM hits WHERE site_id = sites.id) AS views_today FROM sites ORDER BY views_today DESC")
  end
end
