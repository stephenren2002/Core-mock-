

When(/^I replace a document with another document$/) do
  within_frame('content') do
    find('a', :text => fileroomName).click
    find('abbr', :text => '4').click
    find('li', :text => 'Actions').click
    find('a', :text => 'Replace with Document').click
    attach_file('file', 'C:\data\code\core\ma\features\support\Bank Reconciliation.pdf')
    find('a', :text => 'Save').click
  end
end

Then(/^I should see my document with the Replace EDoc type listed$/) do
  within_frame('content') do
  	expect(page).to have_content 'Replace EDoc'
  end
end
