# require libraries/modules heres

require 'nokogiri'
require 'pry'
 
# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta span.location-name").text
# percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
 
def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
 
  projects = {}
 
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

# require "nokogiri"
# require "pry"

# def create_project_hash
#   html = File.read('fixtures/kickstarter.html')
#   kickstarter = Nokogiri::HTML(html)
#   project_hash = {}
#   projects = kickstarter.css("li.project.grid_4")
#   projects.each do |project|
#     title = project.css("h2.bbcard_name strong a").text.to_sym
#     project_hash[title] = {}
#     project_hash[title][:image_link] = project.css("div.project-thumbnail a img").attribute("src").value
#     project_hash[title][:description] = project.css("p.bbcard_blurb").text.strip
#     project_hash[title][:location] = project.css("span.location-name").text
#     project_hash[title][:perecnt_funded] = project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
#   end
#   project_hash
# end


# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("span.location-name").text
# perecnt_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
