require "test_helper"
require_relative '../helpers/user_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  include UserHelper

  def setup
    @user1 = create_user
    @user2 = create_user
    @user3 = create_user
    @relationship1 = Relationship.create(follower: @user1, followee: @user2)
  end

  test "creating a new relationship" do
    assert_difference('Relationship.count') do
      post relationships_url, params: { relationship: { follower_id: @user1.id, followee_id: @user3.id } }
    end
    assert_response :success
  end 
  
  test "creating a duplicate relationship" do
    post relationships_url, params: { relationship: { follower_id: @user1.id, followee_id: @user2.id } }
    assert_response :unprocessable_entity
    assert_includes @response.body, "Follower has already been taken"
  end

  test "deleting a relationship" do
    delete relationship_url(@relationship1)
    assert_response :no_content
    assert_not Relationship.exists?(@relationship1.id)
  end

  test "deleting a non-existent relationship" do
    delete relationship_url(Relationship.last.id + 1)
    assert_response :not_found
    assert_includes @response.body, "Relationship not found"
  end
end
