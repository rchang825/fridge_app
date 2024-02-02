require "application_system_test_case"

class ShoppingItemsTest < ApplicationSystemTestCase
  setup do
    @shopping_item = shopping_items(:one)
  end

  test "visiting the index" do
    visit shopping_items_url
    assert_selector "h1", text: "Shopping items"
  end

  test "should create shopping item" do
    visit shopping_items_url
    click_on "New shopping item"

    fill_in "Fridge item name", with: @shopping_item.fridge_item_name
    fill_in "Name", with: @shopping_item.name
    click_on "Create Shopping item"

    assert_text "Shopping item was successfully created"
    click_on "Back"
  end

  test "should update Shopping item" do
    visit shopping_item_url(@shopping_item)
    click_on "Edit this shopping item", match: :first

    fill_in "Fridge item name", with: @shopping_item.fridge_item_name
    fill_in "Name", with: @shopping_item.name
    click_on "Update Shopping item"

    assert_text "Shopping item was successfully updated"
    click_on "Back"
  end

  test "should destroy Shopping item" do
    visit shopping_item_url(@shopping_item)
    click_on "Destroy this shopping item", match: :first

    assert_text "Shopping item was successfully destroyed"
  end
end
