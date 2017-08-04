Then(/^I should see the (.*) status for the questions$/) do |stat|


  case stat

    when stat='Questions Submitted'

      find('#status').click
      find('.x-combo-list-item', :text => stat).click
      click_on 'Search'
      sleep 2
      #val = find(:xpath,".//div[contains(@class,'x-grid3-body')]")
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      puts "Number of Questions Submitted #@lengthofrow"


      if @lengthofrow > 0

        # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Submitted'
        end

      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
        #puts 'Else part was successfull'
      end


 when stat='Questions Drafting'

  find('#status').click
  find('.x-combo-list-item', :text => stat).click
  click_on 'Search'
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  puts "Number of Questions Drafting #@lengthofrow"
  # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}

  if @lengthofrow > 0
  @questionrow.each do |qa|
    qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
    expect(qa).to have_content 'Drafting'

  end
  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'Else part was successfull'
  end

    when stat='Answers Drafting'

      find('#status').click
      find('.x-combo-list-item', :text => stat).click
      click_on 'Search'
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      puts "Number of Answers Drafting #@lengthofrow"
      # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}

      if @lengthofrow > 0
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Drafting'

        end
      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
        #puts 'Else part was successfull'
      end

when stat='Questions Need Approval'

find('#status').click
find('.x-combo-list-item', :text => stat).click
click_on 'Search'
sleep 2
@questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
@lengthofrow = @questionrow.length
sleep 2
puts "Number of Questions in Needs Approval #@lengthofrow"
# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
  if @lengthofrow > 0
@questionrow.each do |qa|
  qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
  expect(qa).to have_no_content ('Submitted'||'Drafting'||'Answered')

end
    else

      expect(page).to have_content 'No Questions or Answers match your filter criteria'
      #puts 'Else part was successfull'
  end

    when stat='Answers Need Approval'

      find('#status').click
      find('.x-combo-list-item', :text => stat).click
      click_on 'Search'
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      puts "Number of Questions in Needs Approval #@lengthofrow"
# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
      if @lengthofrow > 0
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Needs Approval'

        end
      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
        #puts 'Else part was successfull'
      end


when stat='Questions Answered'

find('#status').click
find('.x-combo-list-item', :text => stat).click
click_on 'Search'
sleep 2
@questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
@lengthofrow = @questionrow.length
sleep 2
puts "Number of Questions Answered #@lengthofrow"

#expect(page).to have_content ''


# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
  if @lengthofrow > 0
@questionrow.each do |qa|
  qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
  expect(qa).to have_content 'Answered'

end
  else

  expect(page).to have_content 'No Questions or Answers match your filter criteria'
  #puts 'Else part was successfull'
  #sleep 2
    click_on 'Reset'
  sleep 2
end

when stat='Answers Submitted'

find('#status').click
find('.x-combo-list-item', :text => stat).click
click_on 'Search'
sleep 2
@questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
@lengthofrow = @questionrow.length
sleep 2
puts "Number of Questions Answered #@lengthofrow"

#expect(page).to have_content ''


# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
if @lengthofrow > 0
  @questionrow.each do |qa|
    qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
    expect(qa).to have_content 'Answered'

  end
else

  expect(page).to have_content 'No Questions or Answers match your filter criteria'
  #puts 'Else part was successfull'
end
click_on 'Reset'
end
end


Then(/^I should see the (.*) Priority for the questions$/) do |prio|
  case prio

    when prio='Low'

click_on 'Reset'
      find('#priority').click
      find('.x-combo-list-item', :text => prio).click
      click_on 'Search'
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      puts "Number of Questions in Low priority is #@lengthofrow"
# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
      if @lengthofrow > 0
      @questionrow.each do |qa|
        qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-7')]").text
        expect(qa).to have_content prio
      end
    else

      expect(page).to have_content 'No Questions or Answers match your filter criteria'
      #puts 'Else part was successfull'
  end


  when prio='Medium'

  find('#priority').click
  find('.x-combo-list-item', :text => prio).click
  click_on 'Search'
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  puts "Number of Questions in Medium priority is #@lengthofrow"
# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    if @lengthofrow > 0
  @questionrow.each do |qa|
    qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-7')]").text
    expect(qa).to have_content prio
  end
  else

  expect(page).to have_content 'No Questions or Answers match your filter criteria'
  #puts 'Else part was successfull'
end


when prio='High'

find('#priority').click
find('.x-combo-list-item', :text => prio).click
click_on 'Search'
sleep 2
@questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
@lengthofrow = @questionrow.length
sleep 2
puts "Number of Questions in High priority is #@lengthofrow"
# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
  if @lengthofrow > 0
@questionrow.each do |qa|
  qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-7')]").text
  expect(qa).to have_content prio
end
else

expect(page).to have_content 'No Questions or Answers match your filter criteria'
#puts 'Else part was successfull'
end
  click_on 'Reset'
      sleep 2
end
end

Then(/^I should see the (.*) Category for the questions$/) do |cate|
  case cate

    when cate='General'


      find('#categoryId').click
      find('.x-combo-list-item', :text => cate).click
      click_on 'Search'
      sleep 3
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      puts "Number of Questions in this category is #@lengthofrow"

# within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
      if @lengthofrow > 0
      @questionrow.each do |ca|
       ca.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-6')]").text
        expect(ca).to have_content cate

      end
        puts 'Category'
    else

      expect(page).to have_content 'No Questions or Answers match your filter criteria'
      #puts 'Else part was successfull'
  end
  end
  end

