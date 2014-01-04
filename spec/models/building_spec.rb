require 'spec_helper'

describe Building do
  
  it { should have_valid(:name).when("Building 1", "Cameron Location")}
  it { should_not have_valid(:name).when('', nil) }

  it { should have_valid(:city).when("Pittsburgh", "Boston") }
  it { should_not have_valid(:city).when(nil, '') }

  it { should have_valid(:state).when("PA", "TX", "MA", "OH", "MN") }
  it { should_not have_valid(:state).when(nil, '', "STEVE", "texas", "this is not a state") }

  it { should have_valid(:address).when("1134 harrison", "33 Harrison Ave.") }
  it { should_not have_valid(:address).when(nil, '') }

  it { should have_valid(:zip_code).when("15218", "02144") }
  it { should_not have_valid(:zip_code).when(nil, "123456", "this5", "123435522")}

  it { should have_valid(:owner).when(Owner.new) }

end
