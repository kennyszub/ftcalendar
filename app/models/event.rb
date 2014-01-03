class Event < ActiveRecord::Base

  attr_accessible :description, :ends_at, :max_volunteers, :signup_url, :starts_at, :title, :organization, :contact, :street, :city, :state, :zip, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode

  searchable do
    text :description
    text :title
    text :organization
    text :signup_url
    text :contact
    text :city
    text :state
    text :street
     :max_volunteers
  end

def address
  [street, city, state, zip].compact.join(', ')
end


  validates_presence_of :description, :ends_at,
                        :max_volunteers, :signup_url,
                        :starts_at, :title, :organization,
                        :contact, :street, :city, :state, :zip


  validates_date :starts_at, :on_or_before => lambda { :ends_at }
end
