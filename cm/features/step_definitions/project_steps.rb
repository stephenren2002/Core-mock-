And(/^I go to the tracker new project window$/) do
  visit "/login?_alfRedirect=%2Fds%2Fr%2Ftracker"
  #expect(page).to have_selector('span.x-panel-header-text', :text => 'Login')
  fill_in 'User name:', :with => 'asingh'
  fill_in 'Password:', :with => 'Test@1234'
  click_on 'Login'
  click_on 'Projects'
  sleep(20)
  expect(page).to have_selector('span.x-tab-strip-text', :text => 'Projects')
end

When(/^I enter the new project with$/) do |project_details|
  # table is a table.hashes.keys # => [:project_name]
  project_details.hashes.each do |project|
    within('#trackerProjectsTabPanel') do
      find(".x-toolbar .x-btn-text", :text => 'New').click
    end
    find(".x-menu-list span.x-menu-item-text", :text => 'Add Project').click
    expect(page).to have_selector('.x-window')

    within('.x-window form') do
      fill_in '* Project Name:', :with => project[:project_name]
      fill_in '* SA Number:', :with => project[:sa_number]
    end

    select_extjs_dropdown project[:datasite_type], :from => '* DataSite Type:'
    choose project[:adjacency]
    select_extjs_dropdown project[:classification], :from => 'Classification:'
    sleep(5)
    select_extjs_dropdown project[:company], :from => '** Company:'
    sleep(5)
    select_extjs_dropdown project[:investment_bank], :from => '** Investment Bank:'
    sleep(5)
    select_extjs_dropdown project[:law_firm], :from => '** Law Firm:'
    sleep(5)
    find('.x-panel-header-text', :text => 'Sales Team').click
    sleep(5)
    click_button 'Edit DataSite Sales Reps'
    sleep(5)
    click_button 'Add Rep'
    sleep(5)
    find('.x-menu-list .x-grid3 .x-grid3-body tr:first-child td:first-child div').click
    sleep(5)
    find('.x-editor input').send_keys(project[:datasite_sales])
    sleep(5)
    find('.x-menu-list .x-grid3 .x-grid3-body tr td.x-grid3-check-col-td').click
    sleep(5)
    find('.x-panel-header-text', :text => 'Project Management Team').click
    sleep(5)
    select_extjs_dropdown project[:pm], :from => '* PM:'
    sleep(5)
    choose project[:pm_location]
    sleep(5)
    select_extjs_dropdown project[:pm_team], :from => '* PM Team:'
    sleep(5)
    find('.x-panel-header-text', :text => 'Location and Revenue').click
    sleep(5)
    select_extjs_dropdown project[:revenue_site], :from => '* Revenue Site:'
    sleep(5)
    select_extjs_dropdown project[:project_timezone], :from => '* Project Time Zone:'
    sleep(5)
    select_extjs_dropdown project[:coi], :from => '* Country of Issuer:'
    sleep(5)
    cr = project[:client_region].split(',')
    choose cr[0]
    select_extjs_dropdown_by_hiddenname cr[1], :hidden_name => 'clientRegion'
    sleep(5)
    fill_in 'Credit Check Number:', :with => project[:credit_check_num]
    fill_in 'Credit Check Cap:', :with => project[:credit_cap]
    select_extjs_dropdown project[:currency], :from => '* Currency:'
    sleep(5)
    if project[:warehouse_pricing] == "true"
      find('input[type=checkbox][name=\'warehousePricing\'').click
    end
    click_on 'Submit'
    sleep(20)
    # click_on 'Cancel'
  end
end

Then(/^the project "([^"]*)" should exist$/) do |project_name|
  click_on 'Home'
  click_on 'Projects'
  newProjectRow = find('#trackerProjectsTabPanel table tr', :text => project_name)
  within newProjectRow do
    find('td div.x-grid3-col-name').click
  end
  expect(page).to have_selector('.x-tab-strip-text', :text => project_name)
  find('.x-tab-strip-active .x-tab-strip-close').click
end

And(/^the project "([^"]*)" can launch$/) do |project_name|
  newProjectRow = find('#trackerProjectsTabPanel table tr', :text => project_name)
  project_window = window_opened_by do
    within newProjectRow do
      find('td a[id^=\'launch_project\']').click
    end
  end

  within_window project_window do
    expect(page).to have_selector('.uber-switcher button', :text => project_name)
  end
end

When(/^I close the project "([^"]*)"$/) do |project_name|
  find("#trackerProjectsTabPanel .x-toolbar .x-btn-text", :text => 'Actions').click
  find(".x-menu-list span.x-menu-item-text", :text => 'Close Project').click
  click_button 'Ok'
  project_row = find('#trackerProjectsTabPanel table tr', :text => project_name)
  expect(project_row).to have_selector('td div.x-grid3-col-18', :text => "Closed")
  ##### rename to prevent issue with future runs. attribute service is not cleaned #####
  # steps %{
  #       When I edit the key details of the project "capy"
  #       And I rename the project "capy" to "capynew"
  #       Then the project "capy" should have the new name "capynew"
  #       }
  click_button '( Logout )'
end

And(/^I delete the project "([^"]*)"$/) do |project_name|
  results = execute_lucene_in_node_browser %Q{TYPE:"project:project" AND @cm\\:title:"#{project_name}"}
  expect(results).to eq(1)
  find('table.grid tr', :text => 'ds:projects').find('td:first-child a').click
  project_number = find('table.grid tr', :text => 'projectNumber').find('td:nth-child(3)').text
  project_uuid = find('table.grid tr', :text => 'sys:node-uuid').find('td:nth-child(3)').text
  ##### delete project is not built #####
  # steps %{
  #       Given I am logged in as an internal user :it_admin
  #       And I go to the tracker "Projects" tab
  #       }
  # find("#trackerProjectsTabPanel .x-toolbar .x-btn-text", :text => 'Actions').click
  # find(".x-menu-list span.x-menu-item-text", :text => 'Delete Project').click
  ##### cleanup alfresco #####
  AlfJsHelper.post_alf_js "#{File.dirname(__FILE__)}/../support/files/delete_test_projects.js"
  ##### remove audit records #####
  system %Q{ sqlplus #{DS[:audit_user][:username]}/#{DS[:audit_user][:pw]}@xe @#{File.dirname(__FILE__)}/../support/sql/delete_test_projects.sql "#{project_number}" "#{project_uuid}" }
end

Then(/^the project "([^"]*)" should not exist$/) do |project_name|
  steps %{
    Given I am logged in as an internal user :merrill_pm
    And I go to the tracker "Projects" tab
  }
  expect(page).not_to have_selector('#trackerProjectsTabPanel table tr', :text => project_name)
end

When(/^I edit the key details of the project "([^"]*)"$/) do |project_name|

  newProjectRow = find('#trackerProjectsTabPanel table tr', :text => project_name)
  puts("going to click on new capy project")
  within newProjectRow do
    find('td div.x-grid3-col-projectNumber').click
  end
  expect(page).to have_selector('.x-tab-strip-text', :text => project_name)
  sleep(5)
  #find('.clickable-text', :text => 'Key Details').click
  find(:xpath, "//div[2]/div[2]/div/div[2]/div[2]/div/div[2]/div/div[2]/div/div[1]/div[1]/ul/li[4]/a[2]/em/span[@class='x-tab-strip-inner']").click
  #find('#trackerProjectsTabPanel li.x-tot2ivn-vr-tab-strip-title a.x-tab-right', :text => 'Key Details').click
  sleep(5)
  expect(page).to have_selector('.main-info dd', :text => project_name)
  sleep(5)
  find("#trackerProjectsTabPanel .x-toolbar .x-btn-text", :text => 'Actions').click
  find(".x-menu-list span.x-menu-item-text", :text => 'Edit Key Details').click
  expect(page).to have_selector('.x-window-header-text', :text => "Edit Key Details")
end

And(/^I rename the project "([^"]*)" to "([^"]*)"$/) do |project_name, new_project_name|
  #title_field = find('input[title=\'name\'')
  #expect(title_field).to have_content(project_name)
  # fill_in title_field, :with => ""
  fill_in '* Project Name:', :with => new_project_name
  click_button 'Save'
  sleep(5)
  expect(page).not_to have_selector('.x-window-header-text', :text => "Edit Key Details")
end

Then(/^the project "([^"]*)" should have the new name "([^"]*)"$/) do |project_name, new_project_name|
  find('.x-tab-strip-active .x-tab-strip-close').click
  #visit current_path
  sleep(5)
  #expect(page).to have_selector('#trackerProjectsTabPanel table tr', :text => new_project_name)
  #expect(page).not_to have_selector('#trackerProjectsTabPanel table tr', :text => project_name)
end