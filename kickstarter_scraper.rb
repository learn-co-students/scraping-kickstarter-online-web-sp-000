require "nokogiri"
#require_relative '/Project' 
require 'pry'

# def get_page 
#   doc = Nokogiri::HTML(open('http://fixtures/kickstarter.html'))
# end 


def create_project_hash
   projects = {}
   kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects[title.to_sym] = {}
  end
  projects
end 


def get_projects 
  projects = get_page.css(".li.project.grid_4")
end 
   

 
 
 def make_projects 
    
 
create_project_hash 
 