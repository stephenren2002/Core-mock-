Then(/^I should see the (.*) link for the questions$/) do |link|
  sleep 3

  case link
    when link='Total Questions Asked'


  count=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[3]').text
 # puts count
  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[1]/td[1]/a/b').click
  sleep 2

  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length

  sleep 2
 # puts @lengthofrow
  if @lengthofrow > 0

    # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    puts 'All questions are getting displayed'
  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
   # puts 'Else part was successfull'
  end

       step 'I click on "Q&A Forum" tab'
      sleep 2



  when link='Questions Drafting'


    qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[4]/td[3]').text
    #puts qdcount

  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[4]/td[1]/a/b').click
      sleep 2
    @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
    @lengthofrow = @questionrow.length
    sleep 2
     # puts @lengthofrow


    if @lengthofrow > 0

      # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
      @questionrow.each do |qa|
        qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
        expect(qa).to have_content 'Drafting'
      end

    else

      expect(page).to have_content 'No Questions or Answers match your filter criteria'
     # puts 'Else part was successfull'
    end
      expect(qdcount).eql?@lengthofrow
    step 'I click on "Q&A Forum" tab'
    sleep 2



    when link='Questions Need Approval'


      qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[5]/td[3]').text
     # puts qdcount

      find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[5]/td[1]/a/b').click
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      #puts @lengthofrow


      if @lengthofrow > 0

        # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Needs Approval'
        end

      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
        #puts 'Else part was successfull'
      end
      expect(qdcount).eql?@lengthofrow
      step 'I click on "Q&A Forum" tab'
      sleep 2



    when link='Questions Submitted'


      qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[6]/td[3]').text
      #puts qdcount

      find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[6]/td[1]/a/b').click
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      #puts @lengthofrow


      if @lengthofrow > 0

        # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Submitted'
        end

      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
       # puts 'Else part was successfull'
      end
      expect(qdcount).eql?@lengthofrow
      step 'I click on "Q&A Forum" tab'
      sleep 2

    when link='Questions Answered'


      qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[7]/td[3]').text
     # puts qdcount

      find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[2]/table/tbody/tr[7]/td[1]/a/b').click
      sleep 2
      @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
      @lengthofrow = @questionrow.length
      sleep 2
      #puts @lengthofrow


      if @lengthofrow > 0

        # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
        @questionrow.each do |qa|
          qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
          expect(qa).to have_content 'Answered'
        end

      else

        expect(page).to have_content 'No Questions or Answers match your filter criteria'
       # puts 'Else part was successfull'
      end
      expect(qdcount).eql?@lengthofrow
      step 'I click on "Q&A Forum" tab'
      sleep 2

  end
  end


When(/^I select Total Questions Asked Today for the Questions$/) do

  sleep 2
  count=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[1]/td[3]').text
  #puts count
  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[1]/td[1]/a/b').click
  sleep 2

  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length

  sleep 2
  #puts @lengthofrow
  if @lengthofrow > 0

    # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    puts 'All questions are getting displayed'
  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'Else part was successfull'
  end

  step 'I click on "Q&A Forum" tab'
  sleep 2
end

When(/^I select Total Questions Drafting for the Questions$/) do
  sleep 2
  qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[3]').text
  #puts qdcount

  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[4]/td[1]/a/b').click
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
 # puts @lengthofrow


  if @lengthofrow > 0

    # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    @questionrow.each do |qa|
      qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
      expect(qa).to have_content 'Drafting'
    end

  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'Else part was successfull'
  end
  expect(qdcount).eql?@lengthofrow
  step 'I click on "Q&A Forum" tab'
  sleep 3
end


When(/^I select Total Questions Need Approval for the Questions$/) do
  sleep 2
  qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[5]/td[3]').text
  #puts qdcount

  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[5]/td[1]/a/b').click
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  #puts @lengthofrow


  if @lengthofrow > 0

    # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    @questionrow.each do |qa|
      qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
      expect(qa).to have_content 'Needs Approval'
    end

  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
   # puts 'Else part was successfull'
  end
  expect(qdcount).eql?@lengthofrow
  step 'I click on "Q&A Forum" tab'
  sleep 3
end


When(/^I select Total Questions Submitted for the Questions$/) do
  sleep 2
  qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[6]/td[3]').text
 # puts qdcount

  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[6]/td[1]/a/b').click
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
 # puts @lengthofrow


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
  expect(qdcount).eql?@lengthofrow
  step 'I click on "Q&A Forum" tab'
  sleep 3
end


When(/^I select Total Questions Answered for the Questions$/) do
  sleep 2
  qdcount=find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[7]/td[3]').text
#  puts qdcount

  find(:xpath,'//*[@id="ContentPane"]/table/tbody/tr/td[1]/table/tbody/tr[7]/td[1]/a/b').click
  sleep 2
  @questionrow = all(:xpath,"//div[contains(@class,'x-grid3-row')]")
  @lengthofrow = @questionrow.length
  sleep 2
  #puts @lengthofrow


  if @lengthofrow > 0

    # within('.x-grid3-body')  #{expect(page).to have_content $data['questiontext1']}
    @questionrow.each do |qa|
      qa.find(:xpath,".//div[contains(@class,'x-grid3-cell-inner x-grid3-col-2')]").text
      expect(qa).to have_content 'Answered'
    end

  else

    expect(page).to have_content 'No Questions or Answers match your filter criteria'
    #puts 'Else part was successfull'
  end
  expect(qdcount).eql?@lengthofrow
  step 'I click on "Q&A Forum" tab'
  sleep 3
end



