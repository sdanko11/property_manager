class Building < ActiveRecord::Base
  belongs_to :owner
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :address
  validates_presence_of :name
  validates_format_of :zip_code, with: /\A\d{5}-\d{4}|\A\d{5}\z/, allow_blank: false
  validates_inclusion_of :state, :in => ['AK','AL', 'AR','AZ','CA','CO', 'CT', 'DC', 'DE',
  'FL', 'GA', 'HI','IA', 'ID', 'IL', 'IN', 'KS','KY', 'LA','MA', 'MD', 'ME', 'MI', 'MN', 'MO', 
  'MS','MT', 'NC', 'ND', 'NE', 'NH', 'NJ', 'NM', 'NV', 'NY','OH', 'OK', 'OR','PA','RI','SC',
  'SD', 'TN','TX', 'UT','VA', 'VT','WA','WI','WV','WY',]
  
end

