# require libraries/modules here
require "nokogiri"

# def create_project_hash
#   html = File.read('fixtures/kickstarter.html')
#   kickstarter = Nokogiri::HTML(html)
#   titles = kickstarter.css("li[class='project grid_4']")
  
#   titles.each do |title|
#   puts title.css("h2[class='bbcard_name']").css("strong").text.delete("\n")
#   puts title.css("h2[class='bbcard_name']").css("span").text.strip #by Someone
#   puts title.css("p[class='bbcard_blurb']").text
# end


# :projects => {
#   "My Great Project"  => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   },
#   "Another Great Project" => {
#     :image_link => "Image Link",
#     :description => "Description",
#     :location => "Location",
#     :percent_funded => "Percent Funded"
#   }
# }

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
