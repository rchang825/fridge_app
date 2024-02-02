require "application_system_test_case"

class ShoppingListItemsTest < ApplicationSystemTestCase
  setup do
    @shopping_list_item = shopping_list_items(:one)
  end

  test "visiting the index" do
    visit shopping_list_items_url
    assert_selector "h1", text: "Shopping list items"
  end

  test "should create shopping list item" do
    visit shopping_list_items_url
    click_on "New shopping list item"

    fill_in "Category", with: @shopping_list_item.category
    fill_in "Name", with: @shopping_list_item.name
    fill_in "Quantity", with: @shopping_list_item.quantity
    click_on "Create Shopping list item"

    assert_text "Shopping list item was successfully created"
    click_on "Back"
  end

  test "should update Shopping list item" do
    visit shopping_list_item_url(@shopping_list_item)
    click_on "Edit this shopping list item", match: :first

    fill_in "Category", with: @shopping_list_item.category
    fill_in "Name", with: @shopping_list_item.name
    fill_in "Quantity", with: @shopping_list_item.quantity
    click_on "Update Shopping list item"

    assert_text "Shopping list item was successfully updated"
    click_on "Back"
  end

  test "should destroy Shopping list item" do
    visit shopping_list_item_url(@shopping_list_item)
    click_on "Destroy this shopping list item", match: :first

    assert_text "Shopping list item was successfully destroyed"
  end
end
