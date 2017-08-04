#########################################################################################################
# File : 02_012_delete_doc.feature                                                                      #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I click on a document$/) do
  within_frame('content') do
    deletedoc = File.join(doclocation, 'FEDERAL DEPOSIT INSURANCE.doc')
    @deletedoctitle = File.basename(deletedoc,'.*')
    find("tr[objtype='document']", :text => @deletedoctitle, :match => :prefer_exact).click
    #find('abbr', :text => '4').click
  end
end

When(/^I click on Actions$/) do
  within_frame('content') do
    find('li', :text => 'Actions').click
  end
end

When(/^I click on Delete$/) do
  within_frame('content') do
	find(:xpath, "//a[contains(text(),'Delete')]").click
  sleep 3
    #find('a', :text => 'Delete').click
    #Accept confirmation popup
    page.driver.browser.switch_to.alert.accept
    sleep 3
  end
end

Then(/^I should see the document marked for deletion in the fileroom summary$/) do
  within_frame('content') do
   within('tr', :text => @deletedoctitle) do
      expect(page).to have_css("abbr[title='Locked for delete']")
    end
  end
end


