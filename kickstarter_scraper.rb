require "nokogiri"
#require "pry"

def create_project_hash
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul li a span.location-name").text.split(",")[0],
      :percent_funded => project.css("div ul li.first.funded strong").text.gsub("%", " ").to_i
    }


# description: kickstarter.css("p.bbcard_blurb").text
# location: kickstarter.css("ul li a span.location-name").text.split(",")[0]
# percent_funded: kickstarter.css("div ul li.first.funded strong").text.gsub("%", " ").to_i
  end
#binding.pry
  projects

end

# create_project_hash

# projects: kickstarter.css("li.project.grid_4")
# title: kickstarter.css("h2.bbcard_name strong a").text
# image link: kickstarter.css("div.project-thumbnail a img").attribute("src").value
# description: kickstarter.css("p.bbcard_blurb").text
# location: kickstarter.css("ul li a span.location-name").text.split(",")[0]
# percent_funded: kickstarter.css("div ul li.first.funded strong").text.gsub("%", " ").to_i