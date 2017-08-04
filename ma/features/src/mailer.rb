def mailsender

  require 'net/smtp'

  filename = Dir.glob(File.join(doclocationcreate, '*.html')).max { |a, b| File.ctime(a) <=> File.ctime(b) }
  "C:/Users/109115/RubymineProjects/DS6_Project_Trail1/features/test_result_report/"
# Read a file and encode it into base64 format
  filecontent = File.read(filename)
  encodedcontent = [filecontent].pack("m") # base64

  marker = "AUNIQUEMARKER"

  body =<<EOF

THIS IS AN AUTO-GENERATED MESSAGE. PLEASE DO NOT REPLY TO THIS EMAIL.

This mail contians the test results of the automated script execution on the new build./n/n Kindly find the attachment.

-------------------------------------------
 Merrill Corporation QA Team
EOF

# Define the main headers.
  part1 =<<EOF
From: <from>@merrillcorp.com                                   -- From
To: <to>@merrillcorp.com                                       -- To
Subject: Sending Attachement
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary=#{marker}
--#{marker}
EOF

# Define the message action
  part2 =<<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{body}
--#{marker}
EOF

# Define the attachment section
  part3 =<<EOF
Content-Type: multipart/mixed; name=\"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename="#{filename}"

#{encodedcontent}
--#{marker}--
EOF

  mailtext = part1 + part2 + part3

# Let's put our code in safe area
  begin
    Net::SMTP.start('<SMTP address>') do |smtp| #-- SMTP address
      smtp.sendmail(mailtext, '109115@merrillcorp.com', ['109115@merrillcorp.com']) #-- From and To
    end
  rescue Exception => e
    print e
  end

end