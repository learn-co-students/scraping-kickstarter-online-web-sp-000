require "nokogiri"
#require_relative '/Project' 
require 'pry'

# def get_page 
#   doc = Nokogiri::HTMML(open('http://fixtures/kickstarter.html'))
# end 


def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  doc = Nokogiri::HTML(html) 
end 


def get_projects 
  projects = get_page.css(".li.project.grid_4")
end 


 def create_project_hash
  projects = create_project_hash.css("li.project.grid_4").first 
 end 
 
 def make_projects 
#   create_project_hash("a")
# image_link = projectphoto - little
# description 
# location 
# percent funded 
 end 
 
# projects: kickstarter.css("li.project.grid_4") 
 

 