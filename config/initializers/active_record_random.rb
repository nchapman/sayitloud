class ActiveRecord::Base
  def self.random
    if (c = count) > 0
      first(:offset => rand(c)) 
    end
  end
end