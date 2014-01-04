require 'spec_helper'

describe 'a real estate agent wants to add a new owner' do

  #Acceptance Criteria
  #Must have the option to add a first name
  #Must have the option to add a last name
  #Must have the option to add an email address
  #Must have the option to add a company name

context "check to see that all the fields are available" do

    it "It has all the correnct fields available" do

      visit 'owners/new'
      
      expect(page).to have_content "First name"
      expect(page).to have_content "Last name"
      expect(page).to have_content "Email address"
      expect(page).to have_button "Create Owner"   
    end
  end

context "check to see if a owner can be created succesfully" do

    it "creates an owner when you clcik Create Owner" do
      owner = FactoryGirl.create(:owner)
      visit 'owners/new'

      fill_in 'First name', :with => owner.first_name
      fill_in "Last name", :with => owner.last_name
      fill_in "Email address", :with => owner.email_address
      fill_in "Company name", :with => owner.company_name
      click_button "Create Owner"
      
      expect(page).to have_content "Owner Added!"
      expect(page).to have_content "First name"
      expect(page).to have_content "Last name"
      expect(page).to have_content "Email address"
      expect(page).to have_button "Create Owner"

    end
  end

  context "Owner is not created if all fields are not filled" do

    it "does not create an owner when you do not fill in email_address" do
      owner = FactoryGirl.create(:owner)
      visit 'owners/new'

      fill_in 'First name', :with => owner.first_name
      fill_in "Last name", :with => owner.last_name
      fill_in "Company name", :with => owner.company_name
      click_button "Create Owner"
      
      expect(page).to have_content "Please Fill out a first name, last name, and email" 
      expect(page).to have_content "First name"
      expect(page).to have_content "Last name"
      expect(page).to have_content "Email address"
      expect(page).to have_button "Create Owner"
      
    end
  end
end