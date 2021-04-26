# require libraries/modules here
require "nokogiri"
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html) 

  projects = {}
  
  #iterate through projects
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      image_link: project.css("div.project-thumbnail a img").attribute("src").value,
      description: project.css("p.bbcard_blurb").text.strip,
      location: project.css("ul.project-meta li a span.location-name").text,
      percent_funded: project.css("li.first.funded strong").text.strip.to_i
    }
  end

  projects

end

create_project_hash