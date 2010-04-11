class Message < ActiveRecord::Base
  belongs_to :site
  
  validates_presence_of :body
  
  def render(name)
    body.gsub(/\{\{\s*?name\s*?\}\}/, name)
  end
end
