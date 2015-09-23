Given(/^I log in to Portal$/) do
visit ('https://hh-est-d01/xdportal/wps/myportal/')

fill_in('username', :with => 'jcox3000')
fill_in('password', :with => 'green123')
  click_button('Login') 
  return unless page.has_content?('Existing session detected')
  click_link('Terminate existing login')
  sleep 3
end

When(/^I request an official copy$/) do
  click_link('Information Services')
  click_link('Request Official copies')
  fill_in('titleNumber', :with => 'syk64942')
  fill_in('customerReference', :with => 'testing')
  click_button('Next', match: :first)
  choose('oc2')
  click_button('Next', match: :first)
  check('chk2')
  check('availDocs0')
  click_button('Next', match: :first)
  click_button('Submit', match: :first)
  sleep 5
end  
  
Then(/^an official copy is created$/) do
page.has_content? ('Your official copies have been delivered below.')
end
