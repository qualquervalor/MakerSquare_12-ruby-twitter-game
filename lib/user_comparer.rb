require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
  class User
    attr_reader :username
    def initialize(username)
        @username = username
    end
    def followers
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['CONSUMER_KEY']
      config.consumer_secret     = ENV['CONSUMER_SECRET']
      config.access_token         = ENV['OAUTH_TOKEN']
      config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
    end

    client.user(@username).followers_count
    end
  end

  class Comparer
    attr_reader :user1, :user2
    def initialize(user1,user2)
        @user1, @user2 = user1, user2
    end
    def compare
        if (user1.followers < user2.followers)
            user2.username
        elsif (user1.followers > user2.followers)
            user1.username
        else
            "equal number"
        end
    end
  end
end