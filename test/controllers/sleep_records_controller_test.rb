require "test_helper"

class SleepRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User = delete.all #resetting users table
    @user = User.find_or_create_by(name: 'Castle')
    @friend = User.find_or_create_by(name: 'Kate')
    Relationship.create(follower: @user, followee: @friend)
    @sleep_record = SleepRecord.create(user: @user, start_time: 1.day.ago, end_time: Time.now)
  end

  test "should create sleep record" do
    assert_difference('SleepRecord.count') do
    post sleep_records_url, params: { sleep_record: { user_id: @user.id, start_time: Time.now, end_time: Time.now } }, as: :json
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
    
    test "should get friends records" do
    get friends_records_sleep_records_url(@user.id), as: :json
    assert_response :success
    end
end
