# require libraries/modules here
require 'nokogiri'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}
  kickstarter.css("li.project.grid_4").each do |project|
     projects[project.css("h2.bbcard_name strong a").text] = {:image_link => project.css("img.projectphoto-little").attribute("src").value,
     :description => project.css("p.bbcard_blurb").text,
   :location => project.css("span.location-name").text,
 :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i}
  end
  return projects
end

create_project_hash
