require 'capybara/cucumber'


def thirtyonecharacters
  'abcdefghijklmnopqrstuvwxyzabcda'
end

def thirtycharacters
  'Knowledge will give U power @1'
end

def fiftyonecharacters
  'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxy'
end

def fiftycharacters
  '1. Experience makes a man perfect. M@ke it Simple.'
end

def oneoo1characters
  'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvw'
end

def oneoocharacters
  'Merrill Technology Services India Private Limited, 10th Floor, Unit 3, Ascendas IT Park, Chennai-113'
end


def seventyonecharacters
  'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs'
end

def seventycharacters
  'Merrill DataSite @ Merrill Corporation @ STP @ US @ World @ 1234567890'
end

def twentyonecharacters
  'abcdefghijklmnopqrstu'
end

def twentycharacters
  '@@Chennai-600 013***'
end


def newuser
  dateTime = Time.new
   "dsv6.automation+newuser#{dateTime.strftime("%d%b%Y")}@gmail.com"
end