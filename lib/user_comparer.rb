require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'pry'

module UserComparer
  class User
    attr_reader :username, :client
    def initialize(username)
        @username = username
        @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['CONSUMER_KEY']
        config.consumer_secret     = ENV['CONSUMER_SECRET']
        config.access_token         = ENV['OAUTH_TOKEN']
        config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
      end
    end
    def followers      
      client.user(username).followers_count
    end
    def following
      client.user(@username).friends_count
    end
    def tweets
      client.user(@username).tweets_count
    end
  end


  class Comparer
    attr_reader :user1, :user2
    def initialize(user1,user2)
        @user1, @user2 = user1, user2
    end
    def compare(fun1,fun2)
        if (fun1 < fun2)
            user2.username
        elsif (fun1 > fun2)
            user1.username
        else
            "equal number"
        end
    end
  end
end