class Event < ActiveRecord::Base

  attr_accessible :description, :ends_at, :max_volunteers, :signup_url, :starts_at, :title, :organization, :contact

  searchable do
    text :description
    text :title
    integer :max_volunteers
  end

  validates_presence_of :description, :ends_at, :max_volunteers, :signup_url, :starts_at, :title, :organization, :contact
  validates_date :starts_at, :on_or_before => lambda { :ends_at }
end
