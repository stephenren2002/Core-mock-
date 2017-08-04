When(/^I replace a placeholder with (.*) by (.*)$/) do |replace,act|

  case

    when replace=='document'

      if act=='right click'
        within_frame('content') do
          sleep 2
          find(:xpath, "//td[text()='Placeholder1']").right_click
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Document')]").click
          docOnePath = File.join(doclocation,'test_pdf.pdf')
          filename = File.basename(docOnePath,".*")
          $replaceddoc1title ="#{$data['placeholder1']} replaced with "+ filename
          fill_in 'name', :with=> $replaceddoc1title
          if docOnePath.match(/^C:\//)
            docOnePath.gsub!(/\//, "\\")
          end
          attach_file('file', docOnePath)
          find('a', :text => 'Save').click
        end
      end


      if act=='action'

        within_frame('content') do
          find('td', :text => $data['placeholder2']).click
          find('li', :text => 'Actions').click
          find('a', :text => 'Replace with Document').click
          docTwoPath = File.join(doclocation,'Bank Reconciliation.pdf')
          filename2 = File.basename(docTwoPath,".*")
          $replaceddoc2title = "#{$data['placeholder2']} replaced with "+ filename2
          fill_in 'name', :with=> $replaceddoc2title
          if docTwoPath.match(/^C:\//)
            docTwoPath.gsub!(/\//, "\\")
          end
          attach_file('file', docTwoPath)
          find('a', :text => 'Save').click
        end
      end


      if act=='hamburger'

        within_frame('content') do
          find(:xpath, "//td[text()='Placeholder3']/following::td[4]").click
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Document')]").click
          docTwoPath = File.join(doclocation,'History.pdf')
          filename3 = File.basename(docTwoPath,".*")
          puts filename3
          $replaceddoc3title = "#{$data['placeholder1']} replaced with "+ filename3
          puts $replaceddoc3title
          sleep 3
          fill_in 'name', :with=> $replaceddoc3title
          if docTwoPath.match(/^C:\//)
            docTwoPath.gsub!(/\//, "\\")
          end
          attach_file('file', docTwoPath)
          find('a', :text => 'Save').click
         end
      end


    when replace=='Folder'

      if act=='right click'

        within_frame('content') do
          find('td', :text => $data['placeholder4']).right_click
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Folder')]").click
          page.accept_alert
          sleep 3
        end
        end

        if act=='action'
          within_frame('content') do
            find('td', :text => $data['placeholder5']).click
            find('li', :text => 'Actions').click
            #sleep 4
            find('a', :text => 'Replace with Folder').click
            page.accept_alert
            sleep 3
          end
        end

      if act=='hamburger'
        within_frame('content') do
          find(:xpath, "//td[text()='Placeholder6']/following::td[4]").click
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Folder')]").click
          page.accept_alert
          sleep 3
        end
      end
  end
end





Then(/^I should see my placeholder with the Replace (.*) type listed$/) do |rep|
  within_frame('content') do
    find("abbr[onclick='commandGroupExpand(event,true)']").click
    if rep=='EDoc'
      expect(page).to have_content 'Replace EDoc'
    elsif rep=='Folder'
      expect(page).to have_content 'Replace Folder'
    end
  end
end


