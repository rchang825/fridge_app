require "test_helper"

class ShoppingListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_list_item = shopping_list_items(:one)
  end

  test "should get index" do
    get shopping_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_list_item_url
    assert_response :success
  end

  test "should create shopping_list_item" do
    assert_difference("ShoppingListItem.count") do
      post shopping_list_items_url, params: { shopping_list_item: { category: @shopping_list_item.category, name: @shopping_list_item.name, quantity: @shopping_list_item.quantity } }
    end

    assert_redirected_to shopping_list_item_url(ShoppingListItem.last)
  end

  test "should show shopping_list_item" do
    get shopping_list_item_url(@shopping_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_list_item_url(@shopping_list_item)
    assert_response :success
  end

  test "should update shopping_list_item" do
    patch shopping_list_item_url(@shopping_list_item), params: { shopping_list_item: { category: @shopping_list_item.category, name: @shopping_list_item.name, quantity: @shopping_list_item.quantity } }
    assert_redirected_to shopping_list_item_url(@shopping_list_item)
  end

  test "should destroy shopping_list_item" do
    assert_difference("ShoppingListItem.count", -1) do
      delete shopping_list_item_url(@shopping_list_item)
    end

    assert_redirected_to shopping_list_items_url
  end
end
