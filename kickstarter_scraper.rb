require "nokogiri"
require "pry"

def create_project_hash
  project_hash = {}
html = File.read("fixtures/kickstarter.html")
kickstarter =  Nokogiri::HTML(html)

kickstarter.css("li.project.grid_4").collect do |project|
title = project.css("h2.bbcard_name strong a").text

project_hash[title.to_sym] = {
:image_link => project.css("div.project-thumbnail a img").attribute("src").value,
:description => project.css("h2.bbcard_name strong a").text,
:location => project.css("span.location-name").text,
:percent_funded => project.css("li.first.funded").text.gsub("%","").to_i
}
end 

project_hash
end
