#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I click a document in the View Index$/) do
	click_on 'View Index'
  within_window(->{ page.title == 'Index - ' + projectName })do
    puts "#{page.title}"
    sleep 2
		# find("div.ellipsis").click
    find(:xpath,"//div[@class='ellipsis']").click
    sleep(3)
		# find('div.ellipsis', :text => $data['fileroom1']).click
		find(:xpath,"(//div[@id='folderSelectorResult']/div)[2]").click
    # within('div.ellipsis'){(find('div', :text =>': '+$data['fileroom1'])).click}
		click_on 'View'
  	sleep(3)
    end
end

And(/^I select specific document in the View Index$/) do
	within_window(->{ page.title == 'Index - ' + projectName })do
	# @viewdoc1 = find(:xpath, "//a[contains(text(),'5 : #{$data['placeholder1']}')]").text
	find(:xpath, "//a[contains(text(),'5 : #{$data['placeholder1']}')]").click
  end
  end

Then(/^I should see the document open in the viewer$/) do
	within_window(->{ page.title == '5: ' + $data['file1name']}) do
		using_wait_time 5 do
			expect(page).to have_css('#toolbarViewer')
			click_on 'Close this window'
		end
	end
	within_window(->{ page.title == 'Index - ' + projectName }) do
		click_on 'Close'
	end
end


