require 'nokogiri'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("li.project.grid_4").each do |project|
    # Grab the title of the project and use it as the key to this project
    title = project.css("h2.bbcard_name strong a").text

    # Set the properties through scraping
    projects[title.to_sym] = {
      image_link: project.css("div.project-thumbnail a img").attribute("src").value,
      description: project.css("p.bbcard_blurb").text.strip,
      location: project.css("ul.project-meta li a").text.strip,
      percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
    }
  end

  projects

end
