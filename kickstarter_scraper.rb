require "nokogiri"
#require_relative '/Project' 
require 'pry'

# def get_page 
#   doc = Nokogiri::HTMML(open('http://fixtures/kickstarter.html'))
# end 


def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
end 


def get_projects 
  projects = get_page.css(".li.project.grid_4")
end 
   

 
 
 def make_projects 
   projects:  
# image_link = img.projectphoto-little 
# description = p.bbcard-blurb 
# location = span.location-name 
# percent funded = li.first.funded 
#page = li.project.grid-4 
# title = h2.bbcard_name strong a.text  
 end 

create_project_hash 
 