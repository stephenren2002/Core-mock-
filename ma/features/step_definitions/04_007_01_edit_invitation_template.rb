And(/^I select Invitation from the Type filter$/) do
  select 'Invitation', from: 'templateTypeFilter'
end

And(/^click on the invitation link present$/) do

  temp = page.all(:xpath,"//tbody[@class='list']//tr[2]//a")
  if temp.size > 0
    page.first(:xpath,"//tbody[@class='list']//tr[2]//a").click
    puts "Successfully clicked @if"
  else
    puts "If - No Rows Found"

  end
end

And(/^click on Edit$/) do
  click_on ' Edit'
end

And(/^click on Save$/) do
  click_on ' Save'
end

Then(/^I should see the edited text in the invitation$/) do
  select 'Invitation', from: 'templateTypeFilter'
  expect(page).to have_content 'This is a edited text in label'
end