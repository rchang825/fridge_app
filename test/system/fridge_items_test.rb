require "application_system_test_case"

class FridgeItemsTest < ApplicationSystemTestCase
  setup do
    @fridge_item = fridge_items(:one)
  end

  test "visiting the index" do
    visit fridge_items_url
    assert_selector "h1", text: "Fridge items"
  end

  test "should create fridge item" do
    visit fridge_items_url
    click_on "New fridge item"

    fill_in "Expiration date", with: @fridge_item.expiration_date
    fill_in "Item name", with: @fridge_item.item_name
    fill_in "Item quantity", with: @fridge_item.item_quantity
    fill_in "Notes", with: @fridge_item.notes
    click_on "Create Fridge item"

    assert_text "Fridge item was successfully created"
    click_on "Back"
  end

  test "should update Fridge item" do
    visit fridge_item_url(@fridge_item)
    click_on "Edit this fridge item", match: :first

    fill_in "Expiration date", with: @fridge_item.expiration_date
    fill_in "Item name", with: @fridge_item.item_name
    fill_in "Item quantity", with: @fridge_item.item_quantity
    fill_in "Notes", with: @fridge_item.notes
    click_on "Update Fridge item"

    assert_text "Fridge item was successfully updated"
    click_on "Back"
  end

  test "should destroy Fridge item" do
    visit fridge_item_url(@fridge_item)
    click_on "Destroy this fridge item", match: :first

    assert_text "Fridge item was successfully destroyed"
  end
end
