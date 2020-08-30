# require libraries/modules here
require 'pry'
require 'nokogiri'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  kickstarter.css("li.project.grid_4").each do | selectedProject |
    title = selectedProject.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => selectedProject.css("div.project-thumbnail a img").attribute("src").value,
      :description => selectedProject.css("p.bbcard_blurb").text,
      :location => selectedProject.css("ul.project-meta a").text,
      :percent_funded => selectedProject.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  end
  return projects
end

create_project_hash
