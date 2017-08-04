And(/^I select a Drafting question for (.*)$/) do |stat|

  case

    when stat=='SFA'
    find('#status').click
    find('.x-combo-list-item', :text => 'Questions Drafting').click
    click_on 'Search'
    sleep 5
    @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
    @lengthofrow = @questionrow.length
    sleep 2

    if @lengthofrow > 0

      within('.x-grid3-body') {
        find('tr', :text => 'Drafting', :match => :first).click
      }
      click_on 'Submit For Approval'
      sleep 2
      within('.x-grid3-body') {
        within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
          expect(page).to have_css('div', :text => 'Needs Approval')
        }
      }

    else
      step 'I save a question as a draft'
      sleep 3
      step 'I select a Drafting question for SOP'
      #expect(page).to have_content 'No Questions or Answers match your filter criteria'
    end




  when stat=='direct Submit'
  find('#status').click
  find('.x-combo-list-item', :text => 'Questions Drafting').click
  click_on 'Search'
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2

  if @lengthofrow > 0

    within('.x-grid3-body') {
      find('tr', :text => 'Drafting', :match => :first).click
    }
    click_on 'Submit'
    sleep 2
click_on 'Yes'
    within('.x-grid3-body') {
      within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
        expect(page).to have_css('div', :text => 'Submitted')
      }
    }

  else

    step 'I save a question as a draft'
    sleep 3
    step 'I select a Drafting question for direct Submit'
    #expect(page).to have_content 'No Questions or Answers match your filter criteria'
  end





  when stat=='save as draft'
  find('#status').click
    find('.x-combo-list-item', :text => 'Questions Drafting').click
    click_on 'Search'
    sleep 2
    @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
    @lengthofrow = @questionrow.length
    sleep 2

    if @lengthofrow > 0

      within('.x-grid3-body') {
        find('tr', :text => 'Drafting', :match => :first).click
      }
      click_on 'Edit'
      fill_in 'text', with: $data['draftqustedit1']
      sleep 2
      click_on 'Save'
      sleep 2
      within('.x-grid3-body') {
        within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
          expect(page).to have_css('div', :text => 'Drafting')
          expect(page).to have_css('div', :text => $data['draftqustedit1'])
        }
      }
    else
      step 'I save a question as a draft'
      sleep 3
      step 'I select a Drafting question for save as draft'
      #expect(page).to have_content 'No Questions or Answers match your filter criteria'
    end



  when stat=='Submit for Approval'
    find('#status').click
    find('.x-combo-list-item', :text => 'Questions Drafting').click
    click_on 'Search'
    sleep 2
    @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
    @lengthofrow = @questionrow.length
    sleep 2

    if @lengthofrow > 0


      within('.x-grid3-body') {
        find('tr', :text => 'Drafting', :match => :first).click
      }
      click_on 'Edit'
      fill_in 'text', with: $data['draftqustedit2']
      sleep 2
      click_on 'Submit For Approval'
      sleep 2
      within('.x-grid3-body') {
        within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
          expect(page).to have_css('div', :text => 'Needs Approval')
          expect(page).to have_css('div', :text => $data['draftqustedit2'])
        }
      }
    else
      step 'I save a question as a draft'
      sleep 3
      step 'I select a Drafting question for Submit for Approval'
      #expect(page).to have_content 'No Questions or Answers match your filter criteria'
      #puts 'Else part was successfull'
    end



    when stat=='submit'
      find('#status').click
      find('.x-combo-list-item', :text => 'Questions Drafting').click
      click_on 'Search'
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2

    if @lengthofrow > 0

    within('.x-grid3-body') {
      find('tr', :text => 'Drafting', :match => :first).click
    }
    click_on 'Edit'
    fill_in 'text', with: $data['draftqustedit2']
    sleep 2
    click_on 'Submit'
    click_on 'Yes'
    within('.x-grid3-body') {
      within('.x-grid3-row.x-grid3-row-first.x-grid3-row-selected') {
        expect(page).to have_css('div', :text => 'Submitted')
        expect(page).to have_css('div', :text => $data['draftqustedit2'])
      }
    }
    else
      step 'I save a question as a draft'
      sleep 3
      step 'I select a Drafting question for submit'

    #expect(page).to have_content 'No Questions or Answers match your filter criteria'
  end
end
end
