And(/^I should see only invitations$/) do
  row_count = all(:xpath, "//tbody[@class='list']/tr").count
  puts 'Total invitation template(s)' + row_count.to_s
  if row_count <= 1
    puts "No Invitation template"
  else
  for i in 2..row_count
    if i <= row_count
      type = find(:xpath, "//*[@id='content']/table/tbody/tr[#{i}]/td[4]").text
      #expect page.find(:xpath, "//*[@class='dataSet']/tbody/tr[#{i}]/td[2]").visible?
      i+1
    end
    expect(type).to eq 'Invitation'
  end
end
end

When(/^I select "([^"]*)" from the Type filter$/) do |filt|
  select filt, from: 'templateTypeFilter'
end

And(/^I should see only Emails$/) do
  row_count = all(:xpath, "//tbody[@class='list']/tr").count
  puts 'Total email template(s)' + row_count.to_s
  if row_count <=1
    puts "No Email template"
  else
  for i in 2..row_count
    if i <= row_count
      type = find(:xpath, "//*[@id='content']/table/tbody/tr[#{i}]/td[4]").text
      #expect page.find(:xpath, "//*[@class='dataSet']/tbody/tr[#{i}]/td[2]").visible?
      i+1
    end
    expect(type).to eq 'Email'
  end
  end
 end

And(/^I should see only Legalese$/) do
  row_count = all(:xpath, "//tbody[@class='list']/tr").count
  if row_count > 2
    puts 'There are multiple legalease templates, which is not accepted'
  else
  for i in 2..row_count
    if i <= row_count
      type = find(:xpath, "//*[@id='content']/table/tbody/tr[#{i}]/td[4]").text
      #expect page.find(:xpath, "//*[@class='dataSet']/tbody/tr[#{i}]/td[2]").visible?
      i+1
    end
    expect(type).to eq 'Legalese'
  end
 end
end