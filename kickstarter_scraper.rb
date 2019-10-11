# require libraries/modules here
require "nokogiri"
require "pry"

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}

  kickstarter.css("li.project.grid_4").each do |stuff|
    # binding.pry
    title = stuff.css("h2.bbcard_name strong a").text
    projects[title]= {
      :image_link => stuff.css("div.project-thumbnail a img").attribute("src").value,
      :description => stuff.css("p.bbcard_blurb").text,
      :location => stuff.css("ul.project-meta span.location-name").text,
      :percent_funded => stuff.css("ul.project-stats li.first.funded strong").text.to_i
    }
  end
  projects
end

# create_project_hash
# projects= kickstarter.css("li.project.grid_4")
# title = project.css("h2.bbcard_name strong a").text
# image link=  project.css("div.project-thumbnail a img").attribute("src").valueproject.css("p.bbcard_blurb").text
# description = project.css("p.bbcard_blurb").text
 # location = project.css("ul.project-meta span.location-name").text
