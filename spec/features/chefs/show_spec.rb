require 'rails_helper'

RSpec.describe 'chefs show page' do
  before(:each) do
    test_data
    visit "/chefs/#{@chef_1.id}"
  end
  describe 'As a visitor when I visit a chefs show page' do
    it 'I see a link to view a list of all ingredients that this chef uses in their dishes.' do
      expect(page).to have_link("Ingredients Used")
    end
  
    it 'when I click on that link, Im taken to a chefs ingredients index page
      and I can see a unique list of names of all the ingredients that this chef uses.' do
      save_and_open_page
      click_link "Ingredients Used By Chef"

      expect(current_path).to eq("/chefs/#{@chef_1.id}/ingredients")
      expect(page).to have_content(@ingredient_1)
      expect(page).to have_content(@ingredient_2)
      expect(page).to have_content(@ingredient_3)
      expect(page).to have_content(@ingredient_4)
    end
    
  end
end
