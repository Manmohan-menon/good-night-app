require "test_helper"

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    User = delete.all #resetting users table
    @user = User.find_or_create_by(name: 'Castle')
    @friend = User.find_or_create_by(name: 'Kate')
    @relationship = Relationship.create(follower: @user, followee: @friend)
  end

  test "should create relationship" do
    new_friend = User.find_or_create_by(name: 'Martha')
    assert_difference('Relationship.count') do
      post relationships_url, params: { relationship: { follower_id: @user.id, followee_id: new_friend.id } }, as: :json
    end
    assert_response :created
  end

  test "should destroy relationship" do
    assert_difference('Relationship.count', -1) do
      delete relationship_url(@relationship), as: :json
    end
    assert_response :no_content
  end
end
