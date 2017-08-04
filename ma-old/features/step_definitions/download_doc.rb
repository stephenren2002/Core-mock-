When(/^I download a document$/) do
  find('tr', :text => phNameTwo).right_click
  find('span', :text => 'Print').click 
  #click_on 'Download'
end

Then(/^I should have the document saved to my system$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
