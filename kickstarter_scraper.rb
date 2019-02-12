# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    projects[project.css("h2.bbcard_name strong a").text.to_sym] = {
      image_link: project.css(".project-thumbnail a img").attribute("src").value,
      description: project.css("p").text,
      location: project.css("span.location-name").text,
      percent_funded: project.css("ul.project-stats .first.funded strong").text.gsub("%","").to_i
    }
  end

  projects

  #all projects: kickstarter.css("li.project.grid_4")
  #title: .css("h2.bbcard_name strong a").text
  #img: .css(".project-thumbnail a img").attribute("src").value
  #desc: .css("p").text
  #location: .css("span.location-name").text
  #percent: .css("ul.project-stats .first.funded strong")text.gsub("%","").to_i


end

create_project_hash
