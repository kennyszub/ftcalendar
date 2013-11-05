class Event < ActiveRecord::Base
  attr_accessible :description, :ends_at, :max_volunteers, :signup_url, :starts_at, :title
end
