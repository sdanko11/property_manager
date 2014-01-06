require 'spec_helper'

describe 'A real estate agent creates a new building' do

    context "Check to see if owners are deleted" do

    it "the owner should not be associated with the building 
    after they are deleted from the system" do

      owner1 = FactoryGirl.create(:owner)
      building = FactoryGirl.create(:building, owner: owner1)

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