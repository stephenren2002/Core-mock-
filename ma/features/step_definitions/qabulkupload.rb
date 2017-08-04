step1_title = "Step 1: Download the simple template"
step1_def = "Once you've added your questions to this easy-to-use template, we can load all your data into the tool without hassle."
step2_title = "Step 2: Upload your populated template.  That's It!"

def autoit_location
  File.expand_path("../../AutoIT/", __FILE__)
end

When(/^I click on the Upload spreadsheet in QA forum$/) do
  puts Dir.pwd
  sleep(2)
  click_on 'Upload Spreadsheet'
end

When(/^I click on the Download button in QA forum$/) do
  click_on 'Download'
end

When (/^I should see 'Step 1 & 2' definitions$/) do
  sleep(3)
  expect(page).to have_content 'Step 1: Download the simple template'
  expect(page).to have_content step1_title
  expect(page).to have_content step1_def
  expect(page).to have_content step2_title
end

When (/^I should see 'Save draft' checkbox with definition$/) do
  expect page.find(:id,"action1").visible?
  expect(page).to have_content 'Save Draft:You can preview and edit questions if you save them as drafts.'
end

When (/^I should see the Save draft checkbox is checked by default$/) do
  #expect page.find(:id,"action1").is_checked
end

When (/^I should see 'Submit for Approval' definition with checkbox$/) do
  expect page.find(:id,"action2").visible?
  expect(page).to have_content 'Submit For Approval:Get your questions approved before routing for answering.'
end

When (/^I should see 'Submit' checkbox with definition$/) do
  expect page.find(:id,"action3").visible?
  expect(page).to have_content 'Submit:Your questions will be routed for answering.'
end

When (/^I should see the 'Choose File' available$/) do
	sleep 3
  #expect page.find(:id,"fileupload").visible?
end

When (/^I click on the 'Choose file' button$/) do
  page.find(:id,"forumFileHeading").click #choosefile_btn
  autoit_file = File.join(autoit_location,'fileupload.exe')
  puts autoit_file
  system(autoit_file)
end

When (/I click on the 'Choose file' button and select "([^"]*)" file$/) do |fn|
  puts "this is the inputed filename "+  fn
  sleep 3
  page.find(:id,"forumFileHeading").click
  sleep 2
  autoit_file = File.join(autoit_location, fn)
   puts autoit_file
  system(autoit_file)
  # select 'action2'
end

Then (/^I should see the preview$/) do
  sleep 3
  expect(page).to have_content 'Question Preview'
  expect(page).to have_content 'Question'
  expect(page).to have_content 'Category'
  expect(page).to have_content 'Priority'
end

def qaupload_preview (filename_QA)
  upload_file = filename_QA
  case upload_file
    when value = "preview_func"
      sleep 2
      expect(page).to have_content 'Question'
      expect(page).to have_content 'Category'
      expect(page).to have_content 'Priority'
      expect(page).to have_content 'Question Preview'
    when value = "draft_question"
      sleep 3
      expect(page).to have_content 'Q1 Save draft: low'
      expect(page).to have_content 'Q3 Save draft: high'
    when value = "sfa_question"
      sleep 3
      expect(page).to have_content 'Q1 SFA: low'
      expect(page).to have_content 'Q3 SFA: high'
    when value = "submit_question"
      sleep 3
      expect(page).to have_content 'Q1 submit: low'
      expect(page).to have_content 'Q3 submit: high'
    when value = "basic_preview"
      sleep 3
      expect(page).to have_content ''
      expect(page).to have_content ''
  end
end

Then (/I should see the preview of "([^"]*)"$/) do |file_preview|
    qaupload_preview (file_preview)
end

When (/I submit the question for "([^"]*)"$/) do |status|
  case status
    when value = "Save-draft"
      sleep 2
      click_on 'continueButton'
    when value = "submit_for_approval"
      sleep 2
      page.find(:id,"action2").click
      click_on 'continueButton'
    when value = 'submit'
      sleep 2
      page.find(:id,"action3").click
      click_on 'continueButton'
      sleep 2
      page.driver.browser.switch_to.alert.accept
    end
end

def error_validation (error_str)
  case error_str
    when value = "start_with Equal_to"
      sleep 2
      expect(page).to have_content "The template values shouldn't start with '='. Found (2) values that start with '='."
    when value = "common_err_1"
      sleep 2
      expect(page).to have_content "There is a problem with one or more items in the import file. The errors are highlighted in the grid below. Please make the necessary corrections in your template and retry the import"
      #expect(page).to have_content "There is a problem with one or more items in the import file"
    when value = "question_w/o_cat"
      #expect page.find(:id,"action3").visible?
      puts "This is the validation for without cat"
  end
end

Then (/I should see the error message: "([^"]*)"$/) do |error|
  error_validation (error)
end

When (/^I go direct to the qa forum page$/) do
  visit 'https://ds6-stage-maw.datasite.com/bidder/forum/forum_container.do?projectId=140404'
end