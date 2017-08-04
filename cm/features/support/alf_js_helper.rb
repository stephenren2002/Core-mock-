require 'rest-client'
require 'json'

module AlfJsHelper
  def self.post_alf_js(js_file)
    url = URIS[:it_tools_uri]
    file = File.new(js_file, 'rb')
    response = RestClient.post url, :filename => file
  end
end