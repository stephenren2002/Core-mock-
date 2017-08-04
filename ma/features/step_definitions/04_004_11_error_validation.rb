When(/^I click on "([^"]*)" button$/) do |but|
  within_frame('content') do
        click_on but
      sleep 3
    end
  end

Then(/^I should see error validation in the add user page$/) do
  within_frame('content') do
    expect(page).to have_content ('Team is required'|| 'Role is required')
  end
end