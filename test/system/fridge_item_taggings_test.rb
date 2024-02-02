require "application_system_test_case"

class FridgeItemTaggingsTest < ApplicationSystemTestCase
  setup do
    @fridge_item_tagging = fridge_item_taggings(:one)
  end

  test "visiting the index" do
    visit fridge_item_taggings_url
    assert_selector "h1", text: "Fridge item taggings"
  end

  test "should create fridge item tagging" do
    visit fridge_item_taggings_url
    click_on "New fridge item tagging"

    fill_in "Fridge item", with: @fridge_item_tagging.fridge_item_id
    fill_in "Tag", with: @fridge_item_tagging.tag_id
    click_on "Create Fridge item tagging"

    assert_text "Fridge item tagging was successfully created"
    click_on "Back"
  end

  test "should update Fridge item tagging" do
    visit fridge_item_tagging_url(@fridge_item_tagging)
    click_on "Edit this fridge item tagging", match: :first

    fill_in "Fridge item", with: @fridge_item_tagging.fridge_item_id
    fill_in "Tag", with: @fridge_item_tagging.tag_id
    click_on "Update Fridge item tagging"

    assert_text "Fridge item tagging was successfully updated"
    click_on "Back"
  end

  test "should destroy Fridge item tagging" do
    visit fridge_item_tagging_url(@fridge_item_tagging)
    click_on "Destroy this fridge item tagging", match: :first

    assert_text "Fridge item tagging was successfully destroyed"
  end
end
