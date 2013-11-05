# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    starts_at "2013-11-04 22:02:55"
    ends_at "2013-11-04 22:02:55"
    description "MyText"
    signup_url "MyText"
    max_volunteers 1
  end
end
