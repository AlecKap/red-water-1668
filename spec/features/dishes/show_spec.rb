require 'rails_helper'

RSpec.describe 'dishes show page' do
  before(:each) do
    test_data
    visit dish_path(@dish_1)
  end
  describe 'As a visitor when I visit a dishs show page' do
    it 'I see the dishs name and description, 
      a list of ingredients for that dish,
      a total calorie count for that dish,
      and I see the chefs name.' do
      save_and_open_page
     
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
end
