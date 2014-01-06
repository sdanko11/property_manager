require 'spec_helper'

describe 'A real estate agent creates a new building' do

    context "Check to see if owners are deleted" do

    it "the owner should not be associated with the building 
    after they are deleted from the system" do

      owner1 = FactoryGirl.create(:owner)
      building = FactoryGirl.build(:building)
      visit 'buildings/new'

      fill_in 'Name', :with => building.name
      fill_in "Address", :with => building.address
      fill_in "City", :with => building.city
      fill_in "State", :with => building.state
      fill_in "Zip code", :with => building.zip_code
      fill_in "Description", :with => building.description
      page.select(owner1.last_name, :from => "Owner")
      click_button "Create Building"
      visit '/buildings/'

      expect(page).to have_content building.name
      expect(page).to have_content building.address
      expect(page).to have_content building.city
      expect(page).to have_content building.state
      expect(page).to have_content building.zip_code
      expect(page).to have_content owner1.first_name
      expect(page).to have_content owner1.last_name
      expect(building.owner_id == owner1.id)

      click_link "Delete Owner"

      expect(page).to_not have_content owner1.first_name
      expect(page).to_not have_content owner1.last_name
      expect(building.owner_id == nil)
    end
  end
end