require 'spec_helper'

describe Owner do
  
  it { should have_valid(:first_name).when("steve", "joe", "Beni") }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when("Danko", "Derda", "Duncan") }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:company_name).when("Austin Relastate", "Big Time Mogals") }

  it { should have_valid(:email_address).when("stevedanko1@gmail.com", "steve@aol.com") }
  it { should_not have_valid(:email_address).when(nil, '') }
  it { should_not have_valid(:email_address).when("steve", "ben", "this is not an email") }

  it { should have_many(:buildings).dependent(:destroy) }
end