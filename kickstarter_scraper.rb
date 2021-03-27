require "nokogiri"
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  doc = Nokogiri::HTML(html) 
  binding.pry 
end




 def create_project_hash
 projects = create_project_hash.css("li.project.grid_4").first 
 end 
 
 def make_projects 
   create_project_hash("a")
 image_link = projectphoto - little
 description 
 location 
 percent funded
 
# projects: kickstarter.css("li.project.grid_4") 
 

 