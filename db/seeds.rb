# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "User 1")
user2 = User.create(name: "User 2")
user3 = User.create(name: "User 3")

User.all.each_with_index do |user, indx|
    user.update(name: "User_#{indx + 1}")
end

Relationship.create(follower: user1, followee: user2)
Relationship.create(follower: user1, followee: user3)

sleep_start_time = Time.current - 8.hours
sleep_end_time = Time.current - 5.hours

SleepRecord.create(user: user1, start_time: sleep_start_time, end_time: sleep_end_time)

