class FridgeItemBuilder
  def build(fridge_item_params, current_user)
    #saves initial quantity to fridge item and grocery
    fridge_item = current_user.fridge_items.build(fridge_item_params)
    item_name = fridge_item.item_name
    fridge_item.grocery_name = item_name
    fridge_item.initial_quantity = fridge_item.item_quantity

    #create new grocery if not already in database
    # grocery = current_user.groceries.find_by(name:item_name)
    # if grocery.blank?
    #   grocery = Grocery.create!(name: item_name, user_id: current_user.id)
    # end
    # fridge_item.grocery_id = grocery.id



    grocery = Grocery.find_or_create_by(name: item_name, user_id: current_user.id)
    fridge_item.grocery_id = grocery.id
    fridge_item
  end
end
