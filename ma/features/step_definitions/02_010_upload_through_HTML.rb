#########################################################################################################
# File : 02_009_upload_through_HTML.feature                                                             #
# Author : Jagan                            Created Date : 30th Nov 2016                                #
# Modified Author : Jagan                   Modified Date : -                                           #
# Info :                                                                                                #
#########################################################################################################
And(/^I click on Folder1 in content frame$/) do
  within_frame 'content' do
    find('td',:text=> $data['folder1']).click
  end
end


And(/^I pick the document in HTML Uploader$/) do
  # within_window windows.last do
  within_window (->{page.title=='Upload Documents'})do
  # htmlupload = File.expand_path("../../src/FEDERAL DEPOSIT INSURANCE.doc",__FILE__)
  htmlupload = File.join(doclocation,'FEDERAL DEPOSIT INSURANCE.doc')
  @filenamehtmluploader = File.basename(htmlupload,'.*')
    if htmlupload.match(/^C:\//)
      htmlupload.gsub!(/\//,"\\")
    end
  Capybara.ignore_hidden_elements = false
  attach_file('file', htmlupload)
  end

end

And(/^I pick the special media document in HTML Uploader$/) do
  # within_window windows.last do
  within_window (->{page.title=='Upload Documents'})do
    # htmlupload = File.expand_path("../../src/FEDERAL DEPOSIT INSURANCE.doc",__FILE__)
    htmlupload = File.join(doclocation,'HarrisLilliburleroShort.mp3')
    @filenamehtmluploader = File.basename(htmlupload,'.*')
    if htmlupload.match(/^C:\//)
      htmlupload.gsub!(/\//,"\\")
    end
    Capybara.ignore_hidden_elements = false
    attach_file('file', htmlupload)
  end
 end

And(/^I click on Upload My Queue in HTML Uploader$/) do
  within_window windows.last do
    find('li',text: 'Upload My Queue').click
  end
end

And(/^I click on Done Uploading Files button in HTML Uploader$/) do
  within_window windows.last do
    find('li',text: 'Already Uploaded').click
    expect(page).to have_content @filenamehtmluploader
    find('li',text: 'Done Uploading Files').click
    Capybara.ignore_hidden_elements = true
  end
end