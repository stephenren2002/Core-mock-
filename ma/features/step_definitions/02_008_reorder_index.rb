#########################################################################################################
# File : 02_008_reorder_index.feature                                                                   #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I click Actions$/) do
  within_frame('content') do
  	find('li', :text => 'Actions').click
  end
end

When(/^I click Reorder Folder Contents$/) do
  within_frame('content') do
    sleep 3
	find('li', :text => 'Actions').click
	sleep 3
	#find(:xpath, "//a[contains(text(),'Reorder Folder Contents')]").click
  	find('a', :text => 'Reorder Folder Contents').click
  end
end

When(/^I move some items to new index locations$/) do
	within_frame('content') do
		within('#listArea') do
			#move index 1 down one spot
			find("span[class='index']", :text => '5').click
		end
		click_on 'Down'
		within('#listArea') do
			#move index 3 up two spots
			find("span[class='index']", :text => '3').click
		end
		click_on 'Up'
		click_on 'Up'
	end
end

Then(/^I should see the fileroom summary page with items locked for edit$/) do
  within_frame('content') do
  	expect(page).to have_content 'Fileroom ID:'
  	expect(page).to have_content 'Folder Numbering Style:'
  	within('#contentListing') do
  		# finds row w/ lock icon AND doc icon
      # expect(page).to have_css('tr abbr[title="Locked for edit"]' && 'abbr', :text => '4')
  		# finds row w/ lock icon AND folder icon
      expect(page).to have_css('tr abbr[title="Locked for edit"]' && 'abbr', :text => 'r')
  	end
  end
end
