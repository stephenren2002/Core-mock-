#########################################################################################################
# File : 02_005_replace_ph_with_doc.feature                                                             #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : -                       Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################

When(/^I replace a placeholder with another document$/) do
  within_frame('content') do
    find('td', :text => $data['placeholder1']).click
    find('li', :text => 'Actions').click
    find('a', :text => 'Replace with Document').click
    # docOnePath = File.expand_path('../../src/test_pdf.pdf', __FILE__)
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
    #add another
    within_frame('menu') do
      find('a', :text => $data['placeholder2']).click
    end
    within_frame('content') do
    find('li', :text => 'Actions').click
    find('a', :text => 'Replace with Document').click
    # docTwoPath = File.expand_path("../../src/Bank Reconciliation.pdf", __FILE__)
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

Then(/^I should see my placeholder with the Replace EDoc type listed$/) do
  within_frame('content') do
    find("abbr[onclick='commandGroupExpand(event,true)']").click
  	expect(page).to have_content 'Replace EDoc'
  end
end

