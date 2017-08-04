And(/^I select a Needs Approval question for (.*)$/) do |need|

  case

  when need=='submit'



  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Need Approval').click
  click_on 'Search'

  sleep 3
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
 # puts "Number of #{stat}: #@lengthofrow"


  if @lengthofrow > 0


  within('.x-grid3-body') {
    find('tr', :text => 'Needs Approval', :match => :first).click
  }



  click_on 'Edit'
  fill_in 'text', with: $data['NeedsApprovaledited1']
  sleep 2
  click_on 'Submit'
  click_on 'Yes'
  within('.x-grid3-body') {
    within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
      expect(page).to have_css('div', :text => 'Submitted')
      expect(page).to have_css('div', :text => $data['NeedsApprovaledited1'])
    }
  }
  else
    step 'I submit a question for approval'
    sleep 3
    step 'I select a Needs Approval question for submit'

    #expect(page).to have_content 'No Questions or Answers match your filter criteria'
  end



  when need=='save'

  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Need Approval').click
  click_on 'Search'

  sleep 5
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  # puts "Number of #{stat}: #@lengthofrow"


  if @lengthofrow > 0


    within('.x-grid3-body') {
      find('tr', :text => 'Needs Approval', :match => :first).click
    }


    click_on 'Edit'
    fill_in 'text', with: $data['NeedsApprovaledited2']
    sleep 2
    click_on 'Save'
    sleep 2
    within('.x-grid3-body') {
      within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
        expect(page).to have_css('div', :text => 'Needs Approval')
        expect(page).to have_css('div', :text => $data['NeedsApprovaledited2'])
      }
    }
  else
    step 'I submit a question for approval'
    sleep 3
    step 'I select a Needs Approval question for save'

    #expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'else part was successfull'
  end




  when need=='direct submit'

  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Need Approval').click
  click_on 'Search'

  sleep 2

  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  # puts "Number of #{stat}: #@lengthofrow"


  if @lengthofrow > 0


    within('.x-grid3-body') {
      find('tr', :text => 'Needs Approval', :match => :first).click
    }


    click_on 'Submit'

click_on 'Yes'




    within('.x-grid3-body') {
      within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
        expect(page).to have_content 'Submitted'

      }
    }
  else

    step 'I submit a question for approval'
    sleep 3
    step 'I select a Needs Approval question for direct submit'
    #expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'else part was successfull'
  end
end

end


