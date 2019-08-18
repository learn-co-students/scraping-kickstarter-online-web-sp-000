require "nokogiri"
require 'pry'

html = File.read('fixtures/kickstarter.html')
kickstarter = Nokogiri::HTML(html)

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  binding.pry
end

