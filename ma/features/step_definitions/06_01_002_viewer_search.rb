#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Vinoth,Jagan            Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I conduct a search$/) do
  within_window(->{ page.title == '5: ' +$data['file1name']}) do
#    sleep 15

    i=1

    until find(:xpath,"//div[@class='progress']",:visible => false)['style'] == 'height: 100%; width: 100%;'
      begin
        #puts find(:xpath,"//div[@class='progress']",:visible => false)['style']
        #puts "Property: "
        #puts find(:xpath,"//div[@class='progress']",:visible => true)['style']
        puts i
        #puts "page loaded"

        if find(:xpath,"//div[@class='progress']",:visible => false)['style'] ==   'height: 100%; width: 100%;' or i == 100
          break
        else
          sleep 1
          i+=1
        end
      rescue Capybara::ElementNotFound
        begin
          # sleep 2
          puts "Rescused" + ' i = ' + i.to_s
          i+=1
        end
      end
    end

    click_on 'Find in Document'
    fill_in 'findInput', with: $data['searchTerm']
  end
end






