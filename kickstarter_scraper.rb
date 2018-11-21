# require libraries/modules here
require 'nokogiri'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    image_link = project.css("div.project-thumbnail a img").attribute("src").value
    projects[title.to_sym] = {
      image_link: image_link,
      description: project.css("p.bbcard_blurb").text,
      percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i,
      location: project.css("ul.project-meta li a span.location-name").text
    }
  end
  projects
end
