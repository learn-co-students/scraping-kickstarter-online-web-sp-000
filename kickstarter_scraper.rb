# require libraries/modules here
require 'nokogiri'

require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  # write your code here
end

binding.pry

create_project_hash
