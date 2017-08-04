And(/^I answer the question$/) do
  click_on 'Reply'
  fill_in 'text', with: $data['answertext4']


end

And(/^I click on Save as draft$/) do
  click_on ' Save Draft'
end

And(/^I click on Submit for approval$/) do
  click_on ' Submit For Approval'
end

And(/^I add attachment for the answer$/) do
    attachmentPath = File.join(doclocation,'TURKISH TEXT DEASCIIFIER.pdf')
    if attachmentPath.match(/^C:\//)
      attachmentPath.gsub!(/\//, "\\")
    end
    attach_file('attachments', attachmentPath, visible: false)

end

And(/^I add see also documents to the answer$/) do
  click_on 'Add See Also'
  def url
    URI.parse(current_url).request_uri
  end
  urlArray = url.split("=")
  projectID = urlArray.at(1)

  within_window(->{ page.current_url == baseSeeAlsoUrl + projectID }) do
    # first('.x-tree-ec-icon.x-tree-elbow-end-plus').click
    find(:xpath,"//span[contains(text(),'#{$data['fileroom1']}')]").double_click
    sleep 2
    first('.x-tree-node-cb').click
    click_on 'Save'
  end
end

When(/^I select a drafting answers$/) do
   find('#status').click
    find('.x-combo-list-item', :text => 'Answers Drafting').click
    click_on 'Search'
    within('.x-grid3-body') {
      find('tr', :text => 'Drafting', :match => :first).click
    }
  end


And(/^I Edit the answer$/) do
  click_on 'Edit'
  fill_in 'text', with: $data['answertext5']
end

And(/^I click on Submit$/) do
  click_on 'Submit'
  click_on 'Yes'
end


When(/^I select a Answers need approval$/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Need Approval').click
  click_on 'Search'
  within('.x-grid3-body') {
    find('tr', :text => 'Needs Approval', :match => :first).click
  }
end

And(/^I click on Manage Categories$/) do
  click_on 'Manage Categories'
  sleep 3
end

And(/^I click on New Category$/) do
  click_on ' New Category'

end


And(/^I add a new category$/) do
  sleep 2
  find(:xpath,"//div[@id='contentPanel']//input[@class='x-form-text x-form-field x-form-focus']").set($data['newcategoryname'])
  find(:xpath,"//span[text()='Question Categories']").click
  find(:id, 'categorySave').click
  expect(find(:xpath,"//div[@id='contentPanel']//div[@class='x-grid3-body']")).to have_content $data['newcategoryname']
#text()='" + $data['newcategoryname'] + "']").exists?).to eq true
end

And(/^I Edit the category$/) do
  find(:xpath,"//div[@id='contentPanel']//div[text()='" + $data['newcategoryname'] + "']").click
  find(:xpath,"//div[@id='contentPanel']//input[@class='x-form-text x-form-field x-form-focus']").set($data['updatecategoryname'])
  find(:xpath,"//span[text()='Question Categories']").click
  find(:id, 'categorySave').click
  sleep 2
  expect(find(:xpath,"//div[@id='contentPanel']//div[@class='x-grid3-body']")).to have_content $data['updatecategoryname']
end

And(/^I Delete the category$/) do
  find(:xpath,"//div[@id='contentPanel']//div[text()='" + $data['updatecategoryname'] + "']/../../td[@class= 'x-grid3-col x-grid3-cell x-grid3-td-checker x-grid3-cell-first ']").click
  #find(:xpath,"//div[@id='contentPanel']//div[text()='" + $data['updatecategoryname'] + "']/../../td[@class= 'x-grid3-col x-grid3-cell x-grid3-td-checker x-grid3-cell-first ']/div").click
  find(:xpath,"//div[@id='contentPanel']//div[text()='" + $data['updatecategoryname'] + "']/../../td[@class= 'x-grid3-col x-grid3-cell x-grid3-td-checker x-grid3-cell-first ']/div/div").click
  sleep 5
  click_on "Delete Categories"
  find(:id,'toCategory').click
  find(:xpath,"//div[@class='x-layer x-combo-list ']//div[text()='General']").click
  find(:xpath,"//div[@class='x-window-footer x-panel-btns']//button[text()='Delete']").click
  expect(find(:xpath,"//div[@id='contentPanel']//div[@class='x-grid3-body']")).not_to have_content $data['updatecategoryname']
end

Then(/^I should see the answer appear in draft list/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Drafting').click
  click_on 'Search'
  find('tr', :text => $itemname, :match => :first).click
  itemname = find(:xpath,"//div[@hidefocus='on']//span[@class='answerText']/../span[2]/span[@class='answerText']").text
  puts itemname
  $itemname = itemname.split(' ')[0]
  puts '1' + $itemname
  expect(itemname).to eq $data['answertext4']
  click_on('Details')
  puts '1' + find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text
  answerstatus = find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text.split(': ')[1]
  puts '2' + answerstatus
  expect(answerstatus).to eq "Drafting"
end

Then(/^I should see the answer appear in Submit for approval list/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Need Approval').click
  click_on 'Search'
  find('tr', :text => $itemname, :match => :first).click
  itemname = find(:xpath,"//div[@hidefocus='on']//span[@class='answerText']/../span[2]/span[@class='answerText']").text
  puts itemname
  $itemname = itemname.split(' ')[0]
  puts '1' + $itemname
  expect(itemname).to eq $data['answertext4']
  click_on('Details')
  puts '1' + find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text
  answerstatus = find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text.split(': ')[1]
  puts '2' + answerstatus
  expect(answerstatus).to eq "Needs Approval"


end

Then(/^I should see the edited answer appear in draft list/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Drafting').click
  click_on 'Search'
  find('tr', :text => $itemname, :match => :first).click
  itemname = find(:xpath,"//div[@hidefocus='on']//span[@class='answerText']/../span[2]/span[@class='answerText']").text
  puts itemname
  $itemname = itemname.split(' ')[0]
  puts '1' + $itemname
  expect(itemname).to eq $data['answertext5']
  click_on('Details')
  puts '1' + find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text
  answerstatus = find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text.split(': ')[1]
  puts '2' + answerstatus
  expect(answerstatus).to eq "Drafting"
end

Then(/^I should see the edited answer appear in Submit for approval list$/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Need Approval').click
  click_on 'Search'
  find('tr', :text => $itemname, :match => :first).click
  itemname = find(:xpath,"//div[@hidefocus='on']//span[@class='answerText']/../span[2]/span[@class='answerText']").text
  puts itemname
  $itemname = itemname.split(' ')[0]
  puts '1' + $itemname
  expect(itemname).to eq $data['answertext5']
  click_on('Details')
  puts '1' + find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text
  answerstatus = find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: block; cursor: default;']//td/b[contains(text(),'Status:')]/..").text.split(': ')[1]
  puts '2' + answerstatus
  expect(answerstatus).to eq "Needs Approval"
end

Then(/^I should see the answer appear in Answered status$/) do
  find('#status').click
  find('.x-combo-list-item', :text => 'Answers Submitted').click
  click_on 'Search'
  find('tr', :text => $itemname, :match => :first).click
  itemname = find(:xpath,"//div[@hidefocus='on']//span[@class='answerText']/../span[2]/span[@class='answerText']").text
  puts itemname
  $itemname = itemname.split(' ')[0]
  puts '1' + $itemname
  expect(itemname).to eq $data['answertext5']

  puts '3' + find(:xpath, "//td[text()=' Submitted']").text
  #puts '1' + find(:xpath,"//div[@class='treeNodeInformation' and @style = 'display: none']//td/b[contains(text(),'Status:')]/..").text
  answerstatus = find(:xpath,"//td[text()=' Submitted']").text.split(': ')[1]
  puts '2' + answerstatus
  expect(answerstatus).to eq "Submitted"
end


And(/^I should see the document linked to the answer$/) do
   expect(find(:xpath,"//div[@id='seeAlsoSection']//span").text).to eq '5: Placeholder1 replaced with test_pdf'
   puts "See also validation"

 end

And(/^I should see a document attached to the answer$/) do
  puts find(:xpath,"//div[@id='attachmentSection']/b").text
    expect(find(:xpath,"//div[@id='attachmentSection']/span").text).to eq 'TURKISH TEXT DEASCIIFIER.pdf'
    puts "Attachment validation"
end