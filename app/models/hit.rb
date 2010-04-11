class Hit < ActiveRecord::Base
  belongs_to :site
  belongs_to :subdomain
  
  validates_presence_of :uuid
end
