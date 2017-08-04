#########################################################################################################
# File : 03_001_01_add_role.feature                                                                     #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click Add Role$/) do
  within_frame('content') do
    click_on 'Add Role'
  end
end

And(/^I enter a UG role name for a role$/) do
  within_frame 'content' do
    fill_in 'label',:with=> $data['ugrole1']
    click_on 'Save'
    click_on 'Save'
    find('a',text: 'Back').click
    click_on 'Add Role'
    fill_in 'label',:with=> $data['ugrole2']
  end
end

Then(/^I should see the new role's detail page$/) do
  within_frame('content') do
    expect(page).to have_content 'Role:' && $data['ugrole2']
    expect(page).to have_content 'Has Watermark: None'
  end
end


And(/^I select "([^"]*)" role$/) do |role|
  within_frame 'content' do
  case
    when role == 'Merrill Admin'
      find(:xpath,"//input[@value=1]").click
    when role == "Site Manager"
      find(:xpath,"//input[@value=2]").click
    when role == 'User Group'
      find(:xpath,"//input[@value=3]").click
  end
  end
end

And(/^I enter a SA role name for a role$/) do
  within_frame 'content' do
    $sa_name = 'Site Admin'+rand(0000..9999).to_s
    fill_in 'label',:with=> $sa_name
    puts "SA_name Value: #{$sa_name}"
   end
end

And(/^I select Q&A forum$/) do
  within_frame 'content' do
  check 'qaTabEnabled'
  check 'displaySubmittedBy'
  end
end

Then(/^I should see the new SA role's detail page$/) do
  within_frame('content') do
  expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[1]/th", :text=> 'Role:'))
  expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[1]/td", :text=> $sa_name))
  expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[2]/th", :text=> 'Type'))
  expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[2]/td", :text=> 'Site Manager'))
  search_enb = find(:xpath,"//th[text()='Enabled']/../../tr[2]/td[1]").text
  puts search_enb
  expect(search_enb).to eq 'Yes'
  search_feat = find(:xpath,"//th[text()='Enabled']/../../tr[2]/td[2]").text
  puts search_feat
  expect(search_feat).to eq 'Search'
  watermark_enb = find(:xpath,"//th[text()='Enabled']/../../tr[3]/td[1]").text
  puts watermark_enb
  expect(watermark_enb).to eq 'No'
  watermark_feat = find(:xpath,"//th[text()='Enabled']/../../tr[3]/td[2]").text
  puts watermark_feat
  expect(watermark_feat).to eq 'Watermarked PDF Downloads'
  download_excel_enb = find(:xpath,"//th[text()='Enabled']/../../tr[4]/td[1]").text
  puts download_excel_enb
  expect(download_excel_enb).to eq 'No'
  download_excel_feat = find(:xpath,"//th[text()='Enabled']/../../tr[4]/td[2]").text
  puts download_excel_feat
  expect(download_excel_feat).to eq 'Download Excel files as Original source files'
  content_enb = find(:xpath,"//th[text()='Enabled']/../../tr[5]/td[1]").text
  puts content_enb
  expect(content_enb).to eq 'Yes'
  content_feat = find(:xpath,"//th[text()='Enabled']/../../tr[5]/td[2]").text
  puts content_feat
  expect(content_feat).to eq 'Content Manager'
  user_enb = find(:xpath,"//th[text()='Enabled']/../../tr[6]/td[1]").text
  puts user_enb
  expect(user_enb).to eq 'Yes'
  user_feat = find(:xpath,"//th[text()='Enabled']/../../tr[6]/td[2]").text
  puts user_feat
  expect(user_feat).to eq 'User Manager'
  edit_role_enb = find(:xpath,"//th[text()='Enabled']/../../tr[7]/td[1]").text
  puts edit_role_enb
  expect(edit_role_enb).to eq 'Yes'
  edit_role_feat = find(:xpath,"//th[text()='Enabled']/../../tr[7]/td[2]").text
  puts edit_role_feat
  expect(edit_role_feat).to eq 'Edit Roles'
  send_email_enb = find(:xpath,"//th[text()='Enabled']/../../tr[8]/td[1]").text
  puts send_email_enb
  expect(send_email_enb).to eq 'Yes'
  send_email_feat = find(:xpath,"//th[text()='Enabled']/../../tr[8]/td[2]").text
  puts send_email_feat
  expect(send_email_feat).to eq 'Send Email'
  user_enab_enb = find(:xpath,"//th[text()='Enabled']/../../tr[9]/td[1]").text
  puts user_enab_enb
  expect(user_enab_enb).to eq 'Yes'
  user_enab_feat = find(:xpath,"//th[text()='Enabled']/../../tr[9]/td[2]").text
  puts user_enab_feat
  expect(user_enab_feat).to eq 'User Enable'
  report_enb = find(:xpath,"//th[text()='Enabled']/../../tr[10]/td[1]").text
  puts report_enb
  expect(report_enb).to eq 'Yes'
  report_feat = find(:xpath,"//th[text()='Enabled']/../../tr[10]/td[2]").text
  puts report_feat
  expect(report_feat).to eq 'Report Manager'
  qaforum_enb = find(:xpath,"//th[text()='Enabled']/../../tr[11]/td[1]").text
  puts qaforum_enb
  expect(qaforum_enb).to eq 'No'
  qaforum_feat = find(:xpath,"//th[text()='Enabled']/../../tr[11]/td[2]").text
  puts qaforum_feat
  expect(qaforum_feat).to eq 'Q&A Forum'
  end
end

And(/^I open created Site Manager role$/) do
  within_frame('content') do
      within('.dataSet') {find('tr', :text => $sa_name, exact:true).click}
  end
end

And(/^I click on Edit Role button$/) do
  within_frame('content') do
  click_on 'Edit Role'
  end
end

And(/^I edit role title$/) do
  within_frame 'content' do
    $sa_name1 = $sa_name + ' Edited'
    fill_in 'label',:with=> $sa_name1
  end
end

Then(/^I should see the Edited SA role's detail page$/) do
  within_frame('content') do
    expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[1]/th", :text=> 'Role:'))
    expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[1]/td", :text=> $sa_name1))
    expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[2]/th", :text=> 'Type'))
    expect(find(:xpath,"//tbody/tr[2]/td/table/tbody/tr[2]/td", :text=> 'Site Manager'))
    puts search_enb = find(:xpath,"//th[text()='Enabled']/../../tr[2]/td[1]").text
    expect(search_enb).to eq 'Yes'
    puts search_feat = find(:xpath,"//th[text()='Enabled']/../../tr[2]/td[2]").text
    expect(search_feat).to eq 'Search'
    puts watermark_enb = find(:xpath,"//th[text()='Enabled']/../../tr[3]/td[1]").text
    expect(watermark_enb).to eq 'No'
    puts watermark_feat = find(:xpath,"//th[text()='Enabled']/../../tr[3]/td[2]").text
    expect(watermark_feat).to eq 'Watermarked PDF Downloads'
    puts download_excel_enb = find(:xpath,"//th[text()='Enabled']/../../tr[4]/td[1]").text
    expect(download_excel_enb).to eq 'No'
    puts download_excel_feat = find(:xpath,"//th[text()='Enabled']/../../tr[4]/td[2]").text
    expect(download_excel_feat).to eq 'Download Excel files as Original source files'
    puts content_enb = find(:xpath,"//th[text()='Enabled']/../../tr[5]/td[1]").text
    expect(content_enb).to eq 'Yes'
    puts content_feat = find(:xpath,"//th[text()='Enabled']/../../tr[5]/td[2]").text
    expect(content_feat).to eq 'Content Manager'
    puts user_enb = find(:xpath,"//th[text()='Enabled']/../../tr[6]/td[1]").text
    expect(user_enb).to eq 'Yes'
    puts user_feat = find(:xpath,"//th[text()='Enabled']/../../tr[6]/td[2]").text
    expect(user_feat).to eq 'User Manager'
    puts edit_role_enb = find(:xpath,"//th[text()='Enabled']/../../tr[7]/td[1]").text
    expect(edit_role_enb).to eq 'Yes'
    puts edit_role_feat = find(:xpath,"//th[text()='Enabled']/../../tr[7]/td[2]").text
    expect(edit_role_feat).to eq 'Edit Roles'
    puts send_email_enb = find(:xpath,"//th[text()='Enabled']/../../tr[8]/td[1]").text
    expect(send_email_enb).to eq 'Yes'
    puts send_email_feat = find(:xpath,"//th[text()='Enabled']/../../tr[8]/td[2]").text
    expect(send_email_feat).to eq 'Send Email'
    puts user_enab_enb = find(:xpath,"//th[text()='Enabled']/../../tr[9]/td[1]").text
    expect(user_enab_enb).to eq 'Yes'
    puts user_enab_feat = find(:xpath,"//th[text()='Enabled']/../../tr[9]/td[2]").text
    expect(user_enab_feat).to eq 'User Enable'
    puts report_enb = find(:xpath,"//th[text()='Enabled']/../../tr[10]/td[1]").text
    expect(report_enb).to eq 'Yes'
    puts report_feat = find(:xpath,"//th[text()='Enabled']/../../tr[10]/td[2]").text
    expect(report_feat).to eq 'Report Manager'
    puts qaforum = find(:xpath,"//table[@class='dataSet']/tbody/tr[11]/td[1]").text
    expect(qaforum).to eq 'Yes'
    puts qaforum_feat = find(:xpath,"//th[text()='Enabled']/../../tr[11]/td[2]").text
    expect(qaforum_feat).to eq 'Q&A Forum'
    puts ques_submit = find(:xpath,"//table[@class='dataSet']/tbody/tr[12]/td[1]").text
    expect(ques_submit).to eq 'Yes'
    puts ques_submit_all = find(:xpath,"//table[@class='dataSet']/tbody/tr[12]/td[2]").text
    expect(ques_submit_all).to eq 'Display Question Submitted by'
    puts specify_access = find(:xpath,"//table[@class='dataSet']/tbody/tr[13]/td[1]").text
    expect(specify_access).to eq 'No'
    puts specify_access_feat = find(:xpath,"//table[@class='dataSet']/tbody/tr[13]/td[2]").text
    expect(specify_access_feat).to eq 'Enable Workflow / Specify Access'
  end
end

And(/^I open edited Site Manager role$/) do
  within_frame('content') do
     within('.dataSet') {find('tr', :text => $sa_name1, exact:true).click}
  end
end

And(/^I click on "([^"]*)" in role page$/) do |roledel|
  within_frame('content') do
    click_on roledel
    page.accept_alert
  end
end

And(/^I should not see the deleted role in list$/) do
  within_frame('content') do
  expect(page).to_not have_content $sa_name1
    end
end