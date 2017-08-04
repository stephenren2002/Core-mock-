#########################################################################################################
# File : 02_011_approve_session.feature                                                                 #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : Jagan                   Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################
When(/^I click on my Needs Approval session$/) do
  within_frame('content') do
    i =1
    until i>=30
      statusvalue = find(:xpath,"//*[@class='odd changeSession']/td[5]").text
      if statusvalue == "Needs Approval"
        find('td', :text => 'Needs Approval').click
        break
      else
        click_on 'Refresh'
      end
      sleep 5
      puts statusvalue
      i+=1
    end
    puts "Document is still processing, It's in status:"+ statusvalue
  	expect(page).to have_content('Status: Needs Approval')
    expect(page).to have_content('Change')
  end
end

When(/^I click Approve$/) do
  within_frame('content') do
  	click_on 'Approve'
  end
end

Then(/^I should see the Session Locks page and my session is not listed$/) do
  within_frame('content') do
    sleep 2
    click_on 'Back'
  	expect(page).to have_content('Status')
  	expect(page).to have_content('Owner')
  	expect(page).to have_content('Fileroom')
  	expect(page).to have_content('Results')
  	expect(page).to have_css('table#dataset')
  end
end


