### UTILITY METHODS ###
World(Rack::Test::Methods)

def create_visitor
  @visitor ||= { :name => "Testy McAdminton", :email => "example@example.com",
    :password => "changeme", :password_confirmation => "changeme" }
end

def find_admin
  @admin ||= Admin.where(:email => @visitor[:email]).first
end

def create_unconfirmed_admin
  create_visitor
  delete_admin
  sign_up
  visit '/admins/sign_out'
end

def create_admin
  create_visitor
  delete_admin
  @admin = FactoryGirl.create(:admin, @visitor)
end

def delete_admin
  @admin ||= Admin.where(:email => @visitor[:email]).first
  @admin.destroy unless @admin.nil?
end

def sign_up
  delete_admin
  visit '/admins/sign_up'
  fill_in "admin_name", :with => @visitor[:name]
  fill_in "admin_email", :with => @visitor[:email]
  fill_in "admin_password", :with => @visitor[:password]
  fill_in "admin_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_admin
end

def sign_in
  visit '/admins/sign_in'
  fill_in "admin_email", :with => @visitor[:email]
  fill_in "admin_password", :with => @visitor[:password]
  click_button "Sign in"
end

### GIVEN ###
Given /^I am not logged in$/ do
  visit '/admins/sign_out'
end

Given /^I am logged in$/ do
  create_admin
  sign_in
end

Given /^I exist as a admin$/ do
  create_admin
end

Given /^I do not exist as a admin$/ do
  create_visitor
  delete_admin
end

Given /^I exist as an unconfirmed admin$/ do
  create_unconfirmed_admin
end

### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/admins/sign_out'
end

When /^I sign up with valid admin data$/ do
  create_visitor
  sign_up
end

When /^I sign up with an invalid email$/ do
  create_visitor
  @visitor = @visitor.merge(:email => "notanemail")
  sign_up
end

When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end

When /^I sign up with a mismatched password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "changeme123")
  sign_up
end

When /^I return to the site$/ do
  visit '/'
end

When /^I sign in with a wrong email$/ do
  @visitor = @visitor.merge(:email => "wrong@example.com")
  sign_in
end

When /^I sign in with a wrong password$/ do
  @visitor = @visitor.merge(:password => "wrongpass")
  sign_in
end

When /^I edit my account details$/ do
  click_link "Edit Account"
  fill_in "admin_name", :with => "newname"
  fill_in "admin_current_password", :with => @visitor[:password]
  click_button "Update"
end

When /^I look at the list of admins$/ do
  visit '/'
end

When /^I look at the add event page$/ do
  visit '/events/new'
end

### THEN ###
Then /^I should be signed in$/ do
  page.should have_content "Logout"
  page.should_not have_content "Sign up"
  page.should_not have_content "Login"
end

Then /^I should be signed out$/ do
  page.should have_content "Sign up"
  page.should have_content "Login"
  page.should_not have_content "Logout"
end

Then /^I see an unconfirmed account message$/ do
  page.should have_content "You have to confirm your account before continuing."
end

Then /^I see a successful sign in message$/ do
  page.should have_content "Signed in successfully."
end

Then /^I should see a successful sign up message$/ do
  page.should have_content "Welcome! You have signed up successfully."
end

Then /^I should see an invalid email message$/ do
  page.should have_content "Email is invalid"
end

Then /^I should see a missing password message$/ do
  page.should have_content "Password can't be blank"
end

Then /^I should see a missing password confirmation message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a mismatched password message$/ do
  page.should have_content "Password doesn't match confirmation"
end

Then /^I should see a signed out message$/ do
  page.should have_content "Signed out successfully."
end

Then /^I see an invalid login message$/ do
  page.should have_content "Invalid email or password."
end

Then /^I should see an account edited message$/ do
  page.should have_content "You updated your account successfully."
end

Then /^I should see my name$/ do
  create_admin
  page.should have_content @admin[:name]
end
