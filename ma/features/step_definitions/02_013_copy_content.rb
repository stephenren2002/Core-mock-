When(/^I select document by "(.*)"$/) do |action|

  if action=='right click'
    within_frame('content') do
      sleep 2
      find(:xpath, "//td[contains(text(),'Placeholder1 replaced with test_pdf')]").right_click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
     end
  end

  if action=='action'
    within_frame('content') do
      find(:xpath, "//td[text()='Placeholder2 replaced with Bank Reconciliation']/following::td[4]").click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end

  if action=='black bar'
    within_frame('content') do
      find(:xpath, "//td[text()='By Hamburger Zoology']/preceding::td[4]").click
      # sleep 2
      # find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end
end

Then(/^I should see my copied document by "(.*)" in the fileroom$/) do |loc|
within_frame('content')do
  within('#contentListing') {
    if loc=='right click'
      expect(page.find(:xpath,"//td[text()='Placeholder1 replaced with test_pdf']"))
    end
    if loc=='action'
      expect(page.find(:xpath,"//td[text()='Placeholder2 replaced with Bank Reconciliation']"))
    end
    if loc=='black bar'
      expect(page.find(:xpath,"//td[text()='By Hamburger Zoology']"))
    end
  }
  sleep 1
  end
end

When(/^I select folder by "(.*)"$/) do |action|

  if action=='right click'
    within_frame('content') do
      sleep 2
      find(:xpath, "//td[contains(text(),'Folder3')]").right_click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end

  if action=='action'
    within_frame('content') do
      find(:xpath, "//td[text()='Folder1']/following::td[4]").click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end

  if action=='black bar'
    within_frame('content') do
      find(:xpath, "//td[text()='Folder4']/preceding::td[4]").click
      # sleep 2
      # find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end
end

Then(/^I should see my copied folder by "(.*)" in the fileroom$/) do |loc|
  within_frame('content')do
    within('#contentListing') {
      if loc=='right click'
        expect(page.find(:xpath,"//td[text()='Folder3']"))
      end
      if loc=='action'
        expect(page.find(:xpath,"//td[text()='Folder1']"))
      end
      if loc=='black bar'
        expect(page.find(:xpath,"//td[text()='Folder4']"))
      end
    }
    sleep 1
  end
end


When(/^I select placeholder by "(.*)"$/) do |action|

  if action=='right click'
    within_frame('content') do
      sleep 2
      find(:xpath, "//td[contains(text(),'Placeholder7')]").right_click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end

  if action=='action'
    within_frame('content') do
      find(:xpath, "//td[text()='Placeholder8']/following::td[4]").click
      sleep 2
      find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end

  if action=='black bar'
    within_frame('content') do
      find(:xpath, "//td[text()='Placeholder9']/preceding::td[4]").click
      # sleep 2
      # find(:xpath,"//td[contains(text(),'Copy')]").click
    end
  end
end

Then(/^I should see my copied placeholder by "(.*)" in the fileroom$/) do |loc|
  within_frame('content')do
    within('#contentListing') {
      if loc=='right click'
        expect(page.find(:xpath,"//td[text()='Placeholder7']"))
      end
      if loc=='action'
        expect(page.find(:xpath,"//td[text()='Placeholder8']"))
      end
      if loc=='black bar'
        expect(page.find(:xpath,"//td[text()='Placeholder9']"))
      end
    }
    sleep 1
  end
end


And(/^I choose destination fileroom to copy$/) do
  sleep 3
  within_frame('content') do
    find(:xpath,"//*[@id='destinationTree']/ul/li[3]/div/span").click
  end
end


And(/^I click on Fileroom3 in left pane$/) do
  within_frame('menu') do
    click_on $data['fileroom3']
  end
end