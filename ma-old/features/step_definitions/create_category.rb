
When(/^I add the category "([^"]*)"$/) do |newCategory|
  click_on 'Manage Categories'
  click_on 'New Category'
  within('.x-grid3-body') {
  	find('#ext-comp-1046')
  	#fill_in (''), with: newCategory
  }


  #('.x-grid3-col.x-grid3-cell.x-grid3-td-label.x-grid3-cell-last.x-form-invalid')

end

Then(/^I should see the new "([^"]*)" category created$/) do |newCategory|
  pending # Write code here that turns the phrase above into concrete actions
end
