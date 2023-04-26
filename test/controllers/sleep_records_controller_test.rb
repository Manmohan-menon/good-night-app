require "test_helper"
require_relative '../helpers/user_helper'

class SleepRecordsControllerTest < ActionDispatch::IntegrationTest
include UserHelper
def setup
    @user1 = create_user
    @user2 = create_user
    @user3 = create_user
    @relationship1 = Relationship.create(follower: @user1, followee: @user2)
    @sleep_record = SleepRecord.create(user_id: @user1.id, start_time: 1.hour.ago, end_time: Time.current)

    # 5.times do
    #   user = User.create(name: Faker::Name.name)
    #   SleepRecord.create(user_id: user.id, start_time: Faker::Time.between(from: 1.week.ago, to: Time.current), end_time: Faker::Time.between(from: 1.week.ago, to: Time.current))
    # end
  end

  test "should create sleep record" do
    assert_difference('SleepRecord.count') do
      post sleep_records_url, params: { sleep_record: { user_id: @user1.id, start_time: Time.now, end_time: Time.now } }, as: :json
    end
    assert_response :created
  end

  test "should not create sleep record without user id" do
    assert_no_difference('SleepRecord.count') do
      post sleep_records_url, params: { sleep_record: { start_time: Time.now, end_time: Time.now } }, as: :json
    end
    assert_response :unprocessable_entity
  end

  test "should get clocked in times" do
    get clock_in_times_sleep_records_url, as: :json
    assert_response :success
  end

  test "should get friends records sleep records url" do
    get "/sleep_records/friends_records_sleep_records/#{@user2.id}"
    assert_response :success
  end
end
