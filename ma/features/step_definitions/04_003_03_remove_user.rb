And(/^select user to remove$/) do
  within_frame ("content") do
    page.find(:xpath,"//select[@name='personId']").click
    sleep 4
    puts page.find(:xpath,"//select[@name='personId']/Option[@value=61]").text
    page.find(:xpath,"//select[@name='personId']").native.send_keys("u")
    page.find(:xpath,"//select[@name='personId']").native.send_keys(:tab)

  end
end

And(/^Verify if the user is removed$/) do
  step 'Select "Communities" from the left pane'
  step 'I select "Community1" in the right panel'
  within_frame ("content") do
    expect(page).not_to have_content "User, Automation"
  end
  end

And(/^Select user to add$/) do
  within_frame ("content") do
  page.find(:xpath,"//select[@name='personId']").click
  sleep 4
  puts page.find(:xpath,"//select[@name='personId']/Option[@value=61]").text
  page.find(:xpath,"//select[@name='personId']").native.send_keys("u")
  page.find(:xpath,"//select[@name='personId']").native.send_keys(:tab)
  end

end

Then (/^Verify if the user is added$/) do
  step 'Select "Communities" from the left pane'
  step 'I select "Community1" in the right panel'
  within_frame ("content") do
  expect(page).to have_content "User, Automation"
 end
end