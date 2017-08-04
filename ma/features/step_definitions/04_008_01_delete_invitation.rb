And(/^click on Delete$/) do
  click_on ' Delete'
  sleep(3)
  page.accept_alert
  sleep(3)
  puts 'Invitation Deleted'
end

Then(/^The invitaion should be deleted$/) do
  sleep 2
  page.has_no_text?'Invitation'
  # select 'Invitation', from: 'templateTypeFilter'
  # expect(page).not_to have_content 'This is a edited text in label'
end