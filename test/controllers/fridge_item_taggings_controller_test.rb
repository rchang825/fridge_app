require "test_helper"

class FridgeItemTaggingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fridge_item_tagging = fridge_item_taggings(:one)
  end

  test "should get index" do
    get fridge_item_taggings_url
    assert_response :success
  end

  test "should get new" do
    get new_fridge_item_tagging_url
    assert_response :success
  end

  test "should create fridge_item_tagging" do
    assert_difference("FridgeItemTagging.count") do
      post fridge_item_taggings_url, params: { fridge_item_tagging: { fridge_item_id: @fridge_item_tagging.fridge_item_id, tag_id: @fridge_item_tagging.tag_id } }
    end

    assert_redirected_to fridge_item_tagging_url(FridgeItemTagging.last)
  end

  test "should show fridge_item_tagging" do
    get fridge_item_tagging_url(@fridge_item_tagging)
    assert_response :success
  end

  test "should get edit" do
    get edit_fridge_item_tagging_url(@fridge_item_tagging)
    assert_response :success
  end

  test "should update fridge_item_tagging" do
    patch fridge_item_tagging_url(@fridge_item_tagging), params: { fridge_item_tagging: { fridge_item_id: @fridge_item_tagging.fridge_item_id, tag_id: @fridge_item_tagging.tag_id } }
    assert_redirected_to fridge_item_tagging_url(@fridge_item_tagging)
  end

  test "should destroy fridge_item_tagging" do
    assert_difference("FridgeItemTagging.count", -1) do
      delete fridge_item_tagging_url(@fridge_item_tagging)
    end

    assert_redirected_to fridge_item_taggings_url
  end
end
