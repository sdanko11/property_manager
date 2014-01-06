class Owner < ActiveRecord::Base
  has_many :buildings, dependent: :nullify
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_format_of :email_address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
  :on => :create, allow_blank: false
end