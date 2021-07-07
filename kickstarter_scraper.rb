# require libraries/modules here
require 'nokogiri'
require 'pry'

# projects: kicstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location: project.css("ul.project-meta li a span.location-name").text
# percent funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i


def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  #Iterate through the projects
  kickstarter.css("li.project.grid_4").each do |project|
    # projects[project] = {} - This is bad because it sets each key to be a big nasty Nokogiri object

    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] ={ #This will use the title of each project as a symbol to create the key in the main projects hash
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta li a span.location-name").text,
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  end

  #return the projects hash
  projects

  # binding.pry
end


create_project_hash
