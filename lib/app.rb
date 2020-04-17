require 'dotenv'
require 'pry'
require 'twitter'

Dotenv.load('../.env')

client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"] 
end

 def login_twitter
    return client
end


#puts client.user("lekillerforever")

puts client.search("Troyes", lang: "fr").first.text 

def client.get_all_tweets(user)
        collect_with_max_id do |max_id|
          options = {count: 1, include_rts: false}
          options[:max_id] = max_id unless max_id.nil?
          user_timeline(user, options)
        end
end

#tweets_alex = client.get_all_tweets("lekillerforever")

#tweets_alex.each do |t|
       # puts client.status(t).text
#end

#client.follow("masterchuck111")

#client.user_timeline("lekillerforever").each do |t|
 #       puts client.status(t).text
#end

follow_paul = client.followers("masterchuck111")

follow_paul.each do |f|
        puts f.screen_name
end