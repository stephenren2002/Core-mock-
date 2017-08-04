
When(/^I answer the question with an attachment$/) do
	attachmentPath = File.expand_path("../../support/TURKISH TEXT DEASCIIFIER.pdf", __FILE__)
    if attachmentPath.match(/^C:\//)
      attachmentPath.gsub!(/\//, "\\")
    end
    click_on 'Reply'
  fill_in 'text', with: answerText
  attach_file('attachments', attachmentPath, visible: false)
  click_on 'Submit'
  click_on 'Yes'
end
