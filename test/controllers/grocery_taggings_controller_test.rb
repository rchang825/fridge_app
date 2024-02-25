require "test_helper"

class GroceryTaggingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grocery_tagging = grocery_taggings(:one)
  end

  test "should get index" do
    get grocery_taggings_url
    assert_response :success
  end

  test "should get new" do
    get new_grocery_tagging_url
    assert_response :success
  end

  test "should create grocery_tagging" do
    assert_difference("GroceryTagging.count") do
      post grocery_taggings_url, params: { grocery_tagging: {  } }
    end

    assert_redirected_to grocery_tagging_url(GroceryTagging.last)
  end

  test "should show grocery_tagging" do
    get grocery_tagging_url(@grocery_tagging)
    assert_response :success
  end

  test "should get edit" do
    get edit_grocery_tagging_url(@grocery_tagging)
    assert_response :success
  end

  test "should update grocery_tagging" do
    patch grocery_tagging_url(@grocery_tagging), params: { grocery_tagging: {  } }
    assert_redirected_to grocery_tagging_url(@grocery_tagging)
  end

  test "should destroy grocery_tagging" do
    assert_difference("GroceryTagging.count", -1) do
      delete grocery_tagging_url(@grocery_tagging)
    end

    assert_redirected_to grocery_taggings_url
  end
end
