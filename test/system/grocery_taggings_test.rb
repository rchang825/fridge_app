require "application_system_test_case"

class GroceryTaggingsTest < ApplicationSystemTestCase
  setup do
    @grocery_tagging = grocery_taggings(:one)
  end

  test "visiting the index" do
    visit grocery_taggings_url
    assert_selector "h1", text: "Grocery taggings"
  end

  test "should create grocery tagging" do
    visit grocery_taggings_url
    click_on "New grocery tagging"

    click_on "Create Grocery tagging"

    assert_text "Grocery tagging was successfully created"
    click_on "Back"
  end

  test "should update Grocery tagging" do
    visit grocery_tagging_url(@grocery_tagging)
    click_on "Edit this grocery tagging", match: :first

    click_on "Update Grocery tagging"

    assert_text "Grocery tagging was successfully updated"
    click_on "Back"
  end

  test "should destroy Grocery tagging" do
    visit grocery_tagging_url(@grocery_tagging)
    click_on "Destroy this grocery tagging", match: :first

    assert_text "Grocery tagging was successfully destroyed"
  end
end
