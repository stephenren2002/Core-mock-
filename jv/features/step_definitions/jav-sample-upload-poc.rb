Given(/^I open the doc processing app$/) do
  visit 'http://doc-conversion.pcf1.cloud.fe.pivotal.io/monitor'
  @rowCount = all('tr').size
  printf('how many',@rowCount)
end

When(/^I upload the file "([^"]*)"$/) do |path|
  drop_in_dropzone(path)
end

Then(/^It should\.\.\.\.be uploaded right\?$/) do
  # However you want to validate
end

# Upload a file to Dropzone.js (used on the test page)
# Other upload forms would be handled differently
def drop_in_dropzone(file_path)
  # Generate a fake input selector
  page.execute_script <<-JS
    fakeFileInput = window.$('<input/>').attr(
      {id: 'fakeFileInput', type:'file'}
    ).appendTo('body');
  JS
  # Attach the file to the fake input selector
  attach_file("fakeFileInput", file_path)
  # Add the file to a fileList array
  page.execute_script("var fileList = [fakeFileInput.get(0).files[0]]")
  # Trigger the fake drop event
  page.execute_script <<-JS
    var e = jQuery.Event('drop', { dataTransfer : { files : [fakeFileInput.get(0).files[0]] } });
    $('.dropzone')[0].dropzone.listeners[0].events.drop(e);
  JS
end