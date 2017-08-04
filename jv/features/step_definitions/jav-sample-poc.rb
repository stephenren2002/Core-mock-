Given(/^I open the app$/) do
  visit '/'
end

When(/^I enter username "([^"]*)" and password "([^"]*)"$/) do |username, password|
  fill_in 'username', :with => username
  fill_in 'password', :with => password
  click_button 'Log In'
end

Then(/^the project navigation bar should be present$/) do
  expect(page).to have_selector('.navproject')
end

Then(/^I click on the project navigation "([^"]*)" tab$/) do |tabName|
  ## TODO: Use a switch here and ensure nav has certain classes?
  ## Or just separate steps for each tab?
  click_on tabName
end

Then(/^I should be on the login page$/) do
  expect(page).to have_content('Log In')
end

Then(/^Users tab should be open$/) do
  expect(page).to have_xpath("//span[text()[contains(., 'First Name')]]")
end

Then (/I click on "([^"]*)" in user's table$/) do |columnName|
    find(:xpath, "//span[text()[contains(., '" + columnName + "')]]").click
end

Then (/users has "([^"]*)" order by "([^"]*)"$/) do |order, columnName| #asc/desc, column name
    number = 0
    within(:xpath, "(//div[@class='ui-grid-header-cell-wrapper'])[2]")  do
        page.all(:xpath, ".//div/span").each do |name|
        break if name.text.downcase.include? columnName.downcase
        number = number + 1
        end
    end
    number = number + 1
    name = ""
    page.all(:xpath, "(//div[@class='ui-grid-viewport ng-isolate-scope'])[2]/div/div/div/div["+ number.to_s + "]").each do |divs|
        if name != ""
            if order == "asc"
                expect(divs.text >= name).to be true
            end
        end
        if name != ""
            if order == "desc"
                expect(divs.text <= name).to be true
            end
        end
        name = divs.text
    end
end