#########################################################################################################
# File : 01_001_create_project.feature                                                                  #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################

Given(/^I am on the Tracker home page$/) do
  within('table.dashboard-table', :match => :prefer_exact) do
    sleep 5
    find('tr', :text => $cnf['datacenter']).click_link 'DataSite Tracker'
  end
  expect(page).to have_content('Add Project')
  expect(page).to have_content('Sales Board')
  expect(page).to have_content('Home Page')
end

When(/^I click the Add Project button$/) do
  click_on 'Add Project'
  expect(page).to have_content('Allow Mobile Access')
end

When(/^I check the Demo checkbox$/) do
  check 'demo'
end

When(/^I enter the Project Name$/) do
  fill_in 'projectDescription', with: projectName
   puts "Project created In Name:"+projectName
end

When(/^I enter "([^"]*)" as Company$/) do |companySearch|
  fill_in 'companyName', with: companySearch, :wait => 10
end

When(/^I select "([^"]*)" from Company dropdown$/) do |companySelect|
    find('#ui-id-1 .ui-menu-item', :text => companySelect).click
end

When(/^I select "([^"]*)" from Deal Source dropdown$/) do |dealSource|
  select(dealSource, :from => 'dealSourceId')
end

When(/^I enter "([^"]*)" as PM$/) do |pmSearch|
  fill_in 'csManagerEmployeeName', with: pmSearch, :wait => 10
end

When(/^I select "([^"]*)" as PM$/) do |pmSelect|
  find('#ui-id-5 .ui-menu-item', :text => pmSelect).click
end

When(/^I enter "([^"]*)" as Sales$/) do |salesSearch|
  fill_in 'salesPersonName', with: salesSearch, :wait => 10
end

When(/^I select "([^"]*)" as Sales$/) do |salesSelect|
  find('#ui-id-7 .ui-menu-item', :text => salesSelect).click
end

When(/^I enter "([^"]*)" as DS Sales$/) do |dsSalesSearch|
  fill_in 'dsSalesPersonName', with: dsSalesSearch, :wait => 10
end

When(/^I select "([^"]*)" as DS Sales$/) do |dsSalesSelect|
  find('#ui-id-9 .ui-menu-item', :text => dsSalesSelect).click
end

When(/^I select "([^"]*)" as the DataSite Type$/) do |dsType|
  select(dsType, :from => 'dsTypeId')
end

When(/^I select "([^"]*)" as the Country of Issuer$/) do |countryOfIssuer|
  select(countryOfIssuer, :from => 'countryOfIssuer')
end

When(/^I select "([^"]*)" as the Revenue Site$/) do |revenueSite|
  select(revenueSite, :from => 'revenueSite')
end

When(/^I select "([^"]*)" as the Project Managing Site$/) do |managingSite|
  select(managingSite, :from => 'managingSite')
end

When(/^I enter "([^"]*)" as the SA Number$/) do |saNumber|
  fill_in 'salesNumber', with: saNumber
end

When(/^I enter "([^"]*)" as the Credit Check Number$/) do |ccNumber|
  fill_in 'creditCheckNumber', with: ccNumber
end

When(/^I enter "([^"]*)" as the Credit Check Cap$/) do |ccCap|
  fill_in 'creditCheckCap', with: ccCap
end

And(/^I check teridion for teridion project$/) do
  teri = $cnf['teridion']
  if teri=='t-on'
    check 'teridionProject'
	else
    puts "This is not a Teridion Project"
  end
end

When(/^I click Submit \(tracker\)$/) do
  #sleep(5.to_i) #pause seems to prevent the "person does not exist in current dc" popup
    sleep 3
  # find('#bValidateAndSubmit').click
  click_on 'bValidateAndSubmit'
end

When(/^I check the New Project, Continue checkbox and Submit$/) do
  check 'ignoreWarning'
end

Then(/^I should see the new project's Tracker page$/) do
expect(page).to have_content('PRIMARY INFORMATION')
expect(page).to have_content('CRITICAL NOTES')
expect(page).to have_content('PROJECT DETAILS')
expect(page).to have_content('ASSET SUMMARY')
end

