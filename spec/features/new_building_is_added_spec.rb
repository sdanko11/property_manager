require 'spec_helper'

describe 'A real estate agent creates a new building' do

  #Acceptance Criteria
  #Must add the address of the building
  #Must add the city
  #Must add the state
  #Must add the zip code
  #has the option to add an owner to the building

    it "It has all the correnct fields to create a building" do

      visit 'buildings/new'

      expect(page).to have_content "Create a New Building"
      expect(page).to have_content "Name"
      expect(page).to have_content "City"
      expect(page).to have_content "State"
      expect(page).to have_content "Zip code"
      expect(page).to have_content "Owner"
      expect(page).to have_button "Create Building"   
    end

context "check to see if a building can be created succesfully" do

    it "creates an building when you clcik Create create builing" do
      owner = FactoryGirl.create(:owner)
      building = FactoryGirl.create(:building)
      visit 'buildings/new'

      fill_in 'Name', :with => building.name
      fill_in "Address", :with => building.address
      fill_in "City", :with => building.city
      fill_in "State", :with => building.state
      fill_in "Zip code", :with => building.zip_code
      fill_in "Description", :with => building.description
      click_button "Create Building"
      
      expect(page).to have_content "Building Added"
      expect(page).to have_content "Name"
      expect(page).to have_content "City"
      expect(page).to have_content "State"
      expect(page).to have_content "Zip code"
      expect(page).to have_content "Owner" 
      expect(page).to have_button "Create Building" 
    end
  end

  context "Building is not created if all required fields are not filled" do

    it "deos not create a building if their is not a vaild state provided" do
      building = FactoryGirl.create(:building)
      visit 'buildings/new'

      fill_in 'Name', :with => building.name
      fill_in "Address", :with => building.address
      fill_in "City", :with => building.city
      fill_in "State", :with => "Texas"
      fill_in "Zip code", :with => building.zip_code
      fill_in "Description", :with => building.description
      click_button "Create Building"
      
      expect(page).to have_content "Please add valid name, city, state abreviation, and zip code" 
      expect(page).to have_button "Create Building" 
      
    end

    it "does not create a building if there is no building name added" do

      building = FactoryGirl.create(:building)
      visit 'buildings/new'

      fill_in "Address", :with => building.address
      fill_in "City", :with => building.city
      fill_in "State", :with => building.state
      fill_in "Zip code", :with => building.zip_code
      fill_in "Description", :with => building.description
      click_button "Create Building"
      
      expect(page).to have_content "Please add valid name, city, state abreviation, and zip code" 
      expect(page).to have_button "Create Building" 
      
    end

    it "does not create a building if city is not added" do
      building = FactoryGirl.create(:building)
      visit 'buildings/new'

      fill_in 'Name', :with => building.name
      fill_in "Address", :with => building.address
      fill_in "State", :with => building.state
      fill_in "Zip code", :with => building.zip_code
      fill_in "Description", :with => building.description
      click_button "Create Building"
      
      expect(page).to have_content "Please add valid name, city, state abreviation, and zip code" 
      expect(page).to have_button "Create Building" 
      
    end

    it "does not create a building if a valid zip code is not added" do
      building = FactoryGirl.create(:building)
      visit 'buildings/new'

      fill_in 'Name', :with => building.name
      fill_in "Address", :with => building.address
      fill_in "State", :with => building.state
      fill_in "Zip code", :with => "134234345345"
      fill_in "Description", :with => building.description
      click_button "Create Building"
      
      expect(page).to have_content "Please add valid name, city, state abreviation, and zip code" 
      expect(page).to have_content "Name"
      expect(page).to have_content "City"
      expect(page).to have_content "State"
      expect(page).to have_content "Zip code"
      expect(page).to have_content "Owner" 
      expect(page).to have_button "Create Building"
      
    end
  end


  context "Real estate owner has the option to add a owner to a builing upon creation" do

    it "it has all of the current owner last names in the drop down" do

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

      expect(page).to have_content "Building Added"

    end
  end 
end