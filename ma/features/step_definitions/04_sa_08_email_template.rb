And(/^I select Email from the Type dropdown$/) do
  select 'Email', from: 'templateCreateType'
end

And(/^Delete created email template$/) do
  click_on "Delete"
end

Then(/^Legalese should not see email in Template$/) do
  sleep 2
  page.has_no_text?'Email'
end