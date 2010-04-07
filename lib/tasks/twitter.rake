namespace :twitter do
  task :update => :environment do
    Tweet.update_from_twitter
  end
end