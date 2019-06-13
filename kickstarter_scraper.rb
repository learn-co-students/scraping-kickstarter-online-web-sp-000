require 'nokogiri'
require 'pry'

# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i

def create_project_hash
  # opens the html file to read
  html = File.read('fixtures/kickstarter.html')
  
  # uses nokogiri to grab HTML and assign to variable
  kickstarter = Nokogiri::HTML(html)
 
  # creates a project hash
  projects = {}
 
  # in the kickstarter css, all projects are within this project grid_4
  # for each li, it is a project
  # where title of project is in project.css
  # where title of project is converted to symbol to serve as key in project hash
  # where values of key :project include image_link, description, location, percent_funded
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end
 
  # return the projects hash
  projects
end