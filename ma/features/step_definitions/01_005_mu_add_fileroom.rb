#########################################################################################################
# File : 01_003_mu_add_fileroom.feature                                                                 #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Jagan                   Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
And(/^Merrill User launch the project$/) do
    page.within_window windows.last do
    within ('.tabs-btn-top') {click_on 'Content Manager'}
    # step 'I click on "Content Manager" tab'
  end
end

When(/^Merrill User click the Add dropdown$/) do
  page.within_window windows.last do
    within_frame('content') do
    find('li', :text => 'Add').click
    end
   end
end

When(/^Merrill User click Add Fileroom button$/) do
  within_window windows.last do
    within_frame('content') do
    find('a', :text => 'Add Fileroom').click
    end
  end
end

And(/^Merrill User create multiple Fileroom$/) do
  page.within_window windows.last do
  i=1
  for i in 1..4
  within_frame('content') do
          fill_in 'description', with: "FileRoom#{i}"
          click_on 'Save'
          click_on 'Move up a folder'
          if i <= 3
            find('li', :text => 'Add').click
            find('a', :text => 'Add Fileroom').click
          end
    end
    i+=1

  end
    end
end

Then(/^Merrill User should see my new fileroom's details page$/) do
  within_window windows.last do
    within_frame('content') do
    expect(page).to have_content 'FileRoom'
    expect(page).to have_content 'Load Date'
    expect(page).to have_content 'Launch Date'
    page.switch_to.frame('menu')
    end
   end
end

Then(/^Merrill User fileroom should be on the left pane navigation tree$/) do
  within_window windows.last do
    within_frame('menu') do
      expect(page).to have_content 'FileRoom1'
      expect(page).to have_content 'FileRoom2'
      expect(page).to have_content 'FileRoom3'
      expect(page).to have_content 'FileRoom4'
      # Local_helper.shift_to_header_frame
    end

  end
end