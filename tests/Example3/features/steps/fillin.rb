Given(/^I am logged in as a user$/) do
  $data = {}
  $data['user_name'] = 'User' + Time.new().to_i.to_s + '@example.org' # Create a random user name
  $data['user_password'] = 'password'

  rest_post_call('http://localhost:4567/add_user', $data)
  
  visit('http://localhost:4567')
  
  fill_in('username', :with => $data['user_name'])
  fill_in('password', :with => $data['user_password'])
  click_button('Sign in')
end

When(/^fill in the form$/) do
#This selects the form and fills in the blank fields
  click_link('Details form')
  fill_in('forename', :with => 'Mark')
  fill_in('surname', :with => 'Lunn')
  fill_in('house_number', :with => '34')
  fill_in('street', :with => 'Mental Street')
  fill_in('city', :with => 'Crazy Town')
  fill_in('postcode', :with => 'PL5 7DE')
  #choose('male')
#This checks the box
  check('swimming')
#This selects from the drop down box  
  select('Audi', :from => 'cars')
end

When(/^I submit the form$/) do
  click_button('Submit')
end

Then(/^the form is accepted$/) do
#Checks the text on the submitted page to ensure it matches the details entered
  expect(page).to have_content('My awesome details are shown below:
My name is Mark Lunn I Live at the following address 34 Mental Street Crazy Town
 PL5 7DE I am male My hobbies are listed below: swimming I drive a audi')
 #assert_match("My name is Mark Lunn")
end

When(/^I enter no details$/) do
click_link('Details form')
end

When(/^I enter invalid details$/) do
#This enters special characters to check they cannot be submitted on the form  
  click_link('Details form')
  fill_in('forename', :with => '&*$^')
  fill_in('surname', :with => '')
  fill_in('house_number', :with => 'R')
  fill_in('street', :with => '&*')
  fill_in('city', :with => '~')
  fill_in('postcode', :with => '~@:')
end

Then(/^an error message is shown$/) do
  expect(page).to have_content('Error! Invalid details entered')
end