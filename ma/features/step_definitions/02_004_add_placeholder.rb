#########################################################################################################
# File : 02_004_add_placeholder.feature                                                                 #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I add multiple placeholder$/) do
  within_frame('content') do
    sleep 3
    find('li', :text => 'Add').click
    sleep 3
    find('a', :text => 'Add Placeholders').click
	#find(:xpath, "//a[contains(text(),'Add Placeholders')]").click
    #find('a', :text => 'Add Placeholders').click
    i=1
    for i in 1..9
      placeholdername =  "Placeholder#{i}\n"
      if i <= 9
        find(:xpath,"//textarea[@id='itemNames']").send_keys placeholdername
      end
      i+=1
    end
  end
end

Then(/^I should see my fileroom summary with newly created placeholder listed$/) do
  within_frame('content') do 
    expect(page).to have_content 'Security'
    expect(page).to have_content 'Primary Contact:'
    expect(page).to have_content 'Auto-Reindex:'
    expect(page).to have_content 'Access Granted to: User Group'
    within('#contentListing') {
      find('td', :text => $data['placeholder1'])
      find('td', :text => $data['placeholder2'])
    }
    within(find('tr', :text => $data['placeholder1'])) {find('.action-icon')}
  end
end

