require 'rubygems'
require 'bundler/setup'
require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('ornellasmike')
user2 = UserComparer::User.new('techpeace')
puts "#{user1.username}'s follower count: #{user1.followers}"
puts "#{user2.username}'s follower count: #{user2.followers}"
puts "#{user1.username}'s freind count: #{user1.following}"
puts "#{user2.username}'s friend count: #{user2.following}"
puts "#{user1.username}'s tweet count: #{user1.tweets}"
puts "#{user2.username}'s tweet count: #{user2.tweets}"

comparer = UserComparer::Comparer.new(user1, user2)
puts "And the user with the most followers is: #{comparer.compare(user1.followers,user2.followers)}"
puts "And the user with the most friends is: #{comparer.compare(user1.following,user2.following)}"
puts "And the user with the most tweets is: #{comparer.compare(user1.tweets,user2.tweets)}"