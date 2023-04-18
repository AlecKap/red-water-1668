require 'rails_helper'

RSpec.describe 'dishes show page' do
  before(:each) do
    test_data
    visit "/dishes/#{@dish_1.id}"
  end
  describe 'As a visitor when I visit a dishs show page' do
    it 'I see the dishs name and description, 
      a list of ingredients for that dish,
      a total calorie count for that dish,
      and I see the chefs name.' do
      within "#dish_info" do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_5.name)
        expect(page).to have_content(@dish_1.total_calorie_count)
        expect(page).to have_content(@chef_1.name)
      end
    end

    # I see a form to add an existing Ingredient to that Dish
    # When I fill in the form with the ID of an Ingredient that exists in the database
    # And I click Submit
    # Then I am redirected to that dish's show page
    # And I see that ingredient is now listed. 

    it 'I see a form to add an existing Ingredient to that Dish,
      when I fill in the form with the ID of an Ingredient that exists
      in the database and I click Submit, I am redirected to that
      dishes show page and I see that ingredient is now listed.' do
      within "#dish_info" do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_5.name)

        expect(page).to_not have_content(@ingredient_6.name)
      end
      
      fill_in :add_ingredient, with: @ingredient_6.id
      click_button "Add Ingredient"
      expect(current_path).to eq("/dishes/#{@dish_1.id}")
      save_and_open_page

      within "#dish_info" do
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_4.name)
        expect(page).to have_content(@ingredient_5.name)
        expect(page).to have_content(@ingredient_6.name)
      end
    end
  end
end
