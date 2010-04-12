module MessagesHelper
  def enable_twitter_links(body)
    body.gsub(/(https?:\/\/\S+)/, '<a href="\1">\1</a>').gsub(/@(\S+)/, '<a href="http://twitter.com/\1">@\1</a>')
  end
end
