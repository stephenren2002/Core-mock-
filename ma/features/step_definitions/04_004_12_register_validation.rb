When(/^I click on save without enter any data$/) do
   # page.visit "https://ds6-stage-maw.datasite.com/rest/registration/register?id=37437eadd0854ec6bc1b719971b4f2f1"
  within_frame('content') do
    within('table.edit') {
      click_on(first('a')['href'])
    }
  end
   within_window(-> { page.title == 'Merrill DataSite Registration' }) do
  click_on 'Save'
  within(:xpath,"//form[@id='saveRegistration']") do
  expect(page).to have_xpath "(//span[@class='tooltip']/img)"
  end
  end
  end

When(/^I enter "(.*)" with no character in the field$/) do |attr|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
      page.find(:id,attr).send_keys(:tab)
      sleep 3
      if attr=='phoneExt' || attr=='state'
        expect(page.find(:id,attr)['class']).to eq ""
      else
      page.find(:xpath,"//input[@id='#{attr}']/../label[@class='error']/span/img").hover
  end
 end
end


Then(/^I should see validation in "(.*)" field error as "(.*)"$/) do |field,error|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
  if field=='orgType' || field=='jobFunction' || field=='country' || field=='challengeId'
    expect(page.find(:xpath,"//select[@id='#{field}']/../label[@class='error']/span/span").text).to eq ("#{error}")
  else
   expect(page.find(:xpath,"//input[@id='#{field}']/../label[@class='error']/span/span").text).to eq ("#{error}")
  sleep 1
    end
  end
end

 When(/^I enter email with no@ character in the field$/) do
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in 'email', with: 'v6datasitecom'
    page.find(:id,'email').send_keys(:tab)
    page.find(:xpath,"//input[@id='email']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter email with emailaddress character in the field$/) do
  # page.visit "https://ds6-stage-maw.datasite.com/rest/registration/register?id=070708c2eea9461985d7d695a41aad01"
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in 'email', with: 'dsv6.automation+newuser44@gmail.com'
    page.find(:id,'email').send_keys(:tab)
  end
end

Then(/^I should not see any error in the "(.*)" field$/) do |reg|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
  expect(page.find(:id,reg)['class']).to eq ""
  end
end


When(/^I enter "(.*)" with exceed limit 31 characters in the field$/) do |limit|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in limit, with: thirtyonecharacters
    page.find(:id,limit).send_keys(:tab)
    page.find(:xpath,"//input[@id='#{limit}']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter "(.*)" with exact limit 30 characters in the field$/) do |exact|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in exact, with: thirtycharacters
    page.find(:id,exact).send_keys(:tab)
  end
end

When(/^I enter "(.*)" with exceed limit 51 characters in the field$/) do |limit|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in limit, with: fiftyonecharacters
    page.find(:id,limit).send_keys(:tab)
    page.find(:xpath,"//input[@id='#{limit}']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter "(.*)" with exact limit 50 characters in the field$/) do |exact|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in exact, with: fiftycharacters
    page.find(:id,exact).send_keys(:tab)
  end
end

When(/^I enter "(.*)" with exceed limit 21 characters in the field$/) do |limit|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in limit, with: twentyonecharacters
    page.find(:id,limit).send_keys(:tab)
    page.find(:xpath,"//input[@id='#{limit}']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter "(.*)" with exact limit 20 characters in the field$/) do |exact|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in exact, with: twentycharacters
    page.find(:id,exact).send_keys(:tab)
   end
end

When(/^I enter "(.*)" with exceed limit 101 characters in the field$/) do |limit|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in limit, with: oneoo1characters
    page.find(:id,limit).send_keys(:tab)
    page.find(:xpath,"//input[@id='#{limit}']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter "(.*)" with exact limit 100 characters in the field$/) do |exact|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in exact, with: oneoocharacters
    page.find(:id,exact).send_keys(:tab)
   end
end


When(/^I enter "(.*)" with exceed limit 71 characters in the field$/) do |limit|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in limit, with: seventyonecharacters
    page.find(:id,limit).send_keys(:tab)
    page.find(:xpath,"//input[@id='#{limit}']/../label[@class='error']/span/img").hover
  end
end

When(/^I enter "(.*)" with exact limit 70 characters in the field$/) do |exact|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in exact, with: seventycharacters
    page.find(:id,exact).send_keys(:tab)
   end
end

When(/^I select no "(.*)" from the dropdown$/) do |org|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    page.find(:id,org).send_keys(:tab)
    page.find(:xpath,"//select[@id='#{org}']/../label[@class='error']/span/img").hover
  end
end

When(/^I select for "(.*)" from the dropdown$/) do |dd|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    if dd=='orgType'
      select 'Private Corporation', :from => dd
    elsif dd=='jobFunction'
      select 'Director', :from => dd
    elsif dd=='country'
      select 'India', :from => dd
    else
      select 'What is the name of the street you grew up on?', :from => dd
  end
  end
end

When(/^I enter "(.*)" characters in the "(.*)" field$/) do |pass,fiel|
   within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    if pass=='no'
    page.find(:id,fiel).send_keys(:tab)
      elsif pass=='lessthan8'
        fill_in fiel, with:'1234'
        page.find(:id,fiel).send_keys(:tab)
    elsif pass=='firstname' ||  pass=='lastname'
      fill_in fiel, with: thirtycharacters
      page.find(:id,fiel).send_keys(:tab)
    elsif pass=='companyname'
      fill_in fiel, with: seventycharacters
      page.find(:id,fiel).send_keys(:tab)
    elsif pass=='email'
      fill_in fiel, with: 'dsv6.automation+newuser44@gmail.com'
      page.find(:id,fiel).send_keys(:tab)
    elsif pass=='direct'
      fill_in fiel, with: 'password'
      page.find(:id,fiel).send_keys(:tab)
    end
  end
end


Then(/^I should see error as "(.*)"$/) do |arg|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
  expect(page).to have_content arg
  end
end


When(/^I enter correct "(.*)" in the field$/) do |final|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in final, with:'Friday@123'
  end
end

When(/^I enter wrong password in the field$/) do
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in 'confirmPassword', with:'Friday123'
  end
end

When(/^I enter "(.*)" with = in the initial in the field$/) do |equal|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in equal, with: '=Hello'
  end
end

When(/^I click on save with "(.*)" email address$/) do |id|
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
  if id=='wrong'
  click_on 'Save'
  elsif id=='right'
    fill_in 'email', with: newuser
    sleep 1
    end
  end
end


When(/^I click on save button in the registration page$/) do
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    click_on 'Save'
     sleep 3
    current_window.close
  end
end

When(/^I enter less than 3 characters in the phone field$/) do
  within_window(-> { page.title == 'Merrill DataSite Registration' }) do
    fill_in 'phone', with: '12'
    page.find(:id,'phone').send_keys(:tab)
    page.find(:xpath,"//input[@id='phone']/../label[@class='error']/span/img").hover
  end
end