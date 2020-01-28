# require libraries/modules here
require "nokogiri"

def create_project_hash
  html = File.read("fixtures/kickstarter.html")

  kickstarter = Nokogiri::HTML(html)

  projects = {}

  projects_text = kickstarter.css(".project-card")
  projects_text.each do |project|
  	project_name = project.css(".bbcard_name").css("a").text
  	image_link = project.css("img").attribute("src").value
  	project_description = project.css(".bbcard_blurb").text
  	project_location = project.css(".location-name").text
  	percent_funded = project.css(".first.funded").css("strong").text.strip.to_i 

  	projects[project_name] = {
  		image_link: image_link,
  		description: project_description,
  		location: project_location,
  		percent_funded: percent_funded
  	}
  end

  projects
end