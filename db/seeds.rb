# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Event.create(title: 'Ken', starts_at: ''
#t.datetime "ends_at"
#t.text     "description"
#t.text     "signup_url"
#t.integer  "max_volunteers"
#t.datetime "created_at",     :null => false
#t.datetime "updated_at", )

startTime = DateTime.new(2013, 12, 3)
endTime = DateTime.new(2013, 12, 5)
Event.create!(:title => 'Birthday', :organization => 'Bears', :contact => 'je@etj.com', :starts_at => startTime, :ends_at => endTime, :description => 'etug', :signup_url => 'etj.com', :max_volunteers => '3')
