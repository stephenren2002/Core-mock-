#########################################################################################################
# File : 05_ug_002_ask_attachment.feature                                                               #
# Author : Julie                            Created Date : 29th Jul 2016                                #
# Modified Author : Raja,Jagan              Modified Date : 30th Nov 2016                               #
# Info :                                                                                                #
#########################################################################################################
When(/^I answer the question with an attachment$/) do
	attachmentPath = File.join(doclocation,'TURKISH TEXT DEASCIIFIER.pdf')
      if attachmentPath.match(/^C:\//)
      attachmentPath.gsub!(/\//, "\\")
    end
    click_on 'Reply'
  fill_in 'text', with: $data['answertext2']
  attach_file('attachments', attachmentPath, visible: false)
  click_on 'Submit'
  click_on 'Yes'
end
