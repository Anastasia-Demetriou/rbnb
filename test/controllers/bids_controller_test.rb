require 'test_helper'

class BidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bids_index_url
    assert_response :success
  end

  test "should get show" do
    get bids_show_url
    assert_response :success
  end

  test "should get create" do
    get bids_create_url
    assert_response :success
  end

  test "should get new" do
    get bids_new_url
    assert_response :success
  end

  test "should get edit" do
    get bids_edit_url
    assert_response :success
  end

  test "should get update" do
    get bids_update_url
    assert_response :success
  end

  test "should get destroy" do
    get bids_destroy_url
    assert_response :success
  end

end
