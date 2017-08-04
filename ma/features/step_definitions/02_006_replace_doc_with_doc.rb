  #require_relative './02_005_replace_ph_with_doc&fol'

When(/^I replace a document with another document by (.*)$/) do |act|

  case

     when act=='right click'
        within_frame('content') do
          sleep 2
          find(:xpath,"//td[text()='#{$data['replaceddoc3title']}']").right_click
          puts $data['replaceddoc3title']
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Document')]").click
          docOnePath = File.join(doclocation,'Chemistry.pptx')
          filename = File.basename(docOnePath,".*")
          $replaceddoc4title ="By Right click " + filename
          puts $replaceddoc4title
          fill_in 'name', :with=> $replaceddoc4title
          if docOnePath.match(/^C:\//)
            docOnePath.gsub!(/\//, "\\")
          end
          attach_file('file', docOnePath)
          find('a', :text => 'Save').click
        end



      when act=='action'

        within_frame('content') do
          sleep 2
          find(:xpath,"//td[text()='#{$replaceddoc4title}']").click
          find('li', :text => 'Actions').click
          find('a', :text => 'Replace with Document').click
          docTwoPath = File.join(doclocation,'Maths.docx')
          filename2 = File.basename(docTwoPath,".*")
          $replaceddoc5title = "By Action "+ filename2
          puts $replaceddoc5title
          fill_in 'name', :with=> $replaceddoc5title
          if docTwoPath.match(/^C:\//)
            docTwoPath.gsub!(/\//, "\\")
          end
          attach_file('file', docTwoPath)
          find('a', :text => 'Save').click
        end



      when act=='hamburger'

        within_frame('content') do
          sleep 2
          find(:xpath,"//td[text()='#{$replaceddoc5title}']/following::td[4]").click
          sleep 2
          find(:xpath,"//td[contains(text(),'Replace with Document')]").click
          docTwoPath = File.join(doclocation,'Zoology.jpg')
          filename3 = File.basename(docTwoPath,".*")
          puts filename3
          $replaceddoc6title = "By Hamburger "+ filename3
          puts $replaceddoc6title
          sleep 3
          fill_in 'name', :with=> $replaceddoc6title
          if docTwoPath.match(/^C:\//)
            docTwoPath.gsub!(/\//, "\\")
          end
          attach_file('file', docTwoPath)
          find('a', :text => 'Save').click
        end
  end
end

 Then(/^I should see my document with the Replace (.*) type listed$/) do |rep|
   within_frame('content') do
     find("abbr[onclick='commandGroupExpand(event,true)']").click
     if rep=='EDoc'
       expect(page).to have_content 'Replace EDoc'
     end
   end
 end
