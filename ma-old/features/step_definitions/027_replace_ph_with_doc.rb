
When(/^I replace a placeholder with another document$/) do
  within_frame('content') do
    find('a', :text => fileroomName).click
    find('td', :text => phNameTwo).click
    find('li', :text => 'Actions').click
    find('a', :text => 'Replace with Document').click
    docOnePath = File.expand_path('../../support/test_pdf.pdf', __FILE__)
    if docOnePath.match(/^C:\//)
      docOnePath.gsub!(/\//, "\\")
    end
    attach_file('file', docOnePath)
    find('a', :text => 'Save').click
  end
    #add another
    within_frame('menu') do
      find('a', :text => fileroomName).click
    end
    within_frame('content') do
    find('td', :text => phNameOne).click
    find('li', :text => 'Actions').click
    find('a', :text => 'Replace with Document').click
    docTwoPath = File.expand_path("../../support/Bank Reconciliation.pdf", __FILE__)
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

