require 'rest-client'
require 'json'

module MailHelper
  def self.get_mail_messages(search = nil)
    headers = {
        :api_token => '21e1af052435a53bb37a1a63d43e7180',
        :content_type => :json,
        :accept => :json
    }
    inbox_id = "89309"

    url = "https://mailtrap.io/api/v1/inboxes/#{inbox_id}/messages?page=1"
    unless search.nil?
      url = "#{url}search=#{search}"
    end

    response = RestClient.get url, headers
    result = JSON.parse(response.body)
  end

  def self.get_last_email_url_by_user(username)
    api_token = '21e1af052435a53bb37a1a63d43e7180'
    "https://mailtrap.io" + get_mail_messages(username)[0]["html_path"] + "?api_token=" + api_token;
  end
end