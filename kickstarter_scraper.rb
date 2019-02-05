# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  project_cards = kickstarter.css(".project-card")

  projects = Hash.new

  project_cards.each do |card|
    title = card.css("h2.bbcard_name strong a").text
    projects[title] = {
      image_link: card.css("div.project-thumbnail a img.projectphoto-little").attribute("src").value,
      description: card.css("p.bbcard_blurb").text,
      location: card.css("ul.project-meta li a span.location-name").text,
      percent_funded: card.css("ul.project-stats li.first.funded strong").text.to_i
    }
  end

  projects
    

end
