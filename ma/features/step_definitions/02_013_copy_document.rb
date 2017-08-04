And(/^I checked on all select check box$/) do
  sleep 2
  within_frame('content') do
    find(:xpath,"//th[@class='check-all']").click
  end
end

And(/^I click on copy button$/) do
  within_frame('content') do
    #find(:xpath,"//div[@class='selection-bar screenonly']") do
     # click_on "Copy"
    find('a', :text => 'Copy').click
    end
  end


And(/^I choose destination fileroom$/) do
  sleep 3
  within_frame('content') do
    #click_on $data['fileroom2']
  find(:xpath,"//*[@id='destinationTree']/ul/li[2]/div/span").click
    end
end

And(/^I click on Save button$/) do
  within_frame('content') do
    sleep 3
    click_on 'Save'
  end
end

Then(/^I should see my fileroom summary with copied folder listed$/) do
  within_frame('content') do
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: User Group'
    within('#contentListing') {
      find('td', :text => $data['folder1'])
      find('td', :text => $data['folder2'])
    }
    within(find('tr', :text => $data['folder1'])) {find('.doMenu')}
  end
end

Then(/^I should see my fileroom summary with copied document listed$/) do
  within_frame('content') do
    within('#contentListing') {
        find('td', :text => $data['placeholder7'])
    }
    within(find('tr', :text => $data['placeholder7'])) {find('.doMenu')}
  end
end

docOnePath = File.join(doclocation,'test_pdf.pdf')
filename = File.basename(docOnePath,".*")
$replaceddoc1title ="#{$data['placeholder1']} replaced with "+ filename
docTwoPath = File.join(doclocation,'Bank Reconciliation.pdf')
filename2 = File.basename(docTwoPath,".*")
$replaceddoc2title = "#{$data['placeholder2']} replaced with "+ filename2

Then(/^I should see my fileroom summary with copied placeholder listed$/) do
  within_frame('content') do
    within('#contentListing') {
      find('td', :text => $replaceddoc1title)
      find('td', :text => $replaceddoc2title)
    }
    within(find('tr', :text => $replaceddoc1title)) {find('.doMenu')}
    end
end
