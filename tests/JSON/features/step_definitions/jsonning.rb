Given(/^I have a title number$/) do
  
  $structure = getstubjson("DT160760")
end

When(/^the JSON is returned$/) do
 $structure_hash = JSON.parse($structure)
end

Then(/^the data returned is correct$/) do
  puts $structure_hash['application_reference'] + ' application_reference'
  expect($structure_hash['application_reference']).to eq("UPD0018")
   puts $structure_hash['title_number'] + ' title_number'
  expect($structure_hash['title_number']).to eq("DT160760")
   puts $structure_hash['dlr'] + ' dlr'
    expect($structure_hash['dlr']).to eq("Weymouth Office")

	  puts $structure_hash['uprns'][0].to_s + ' uprns'

 end 