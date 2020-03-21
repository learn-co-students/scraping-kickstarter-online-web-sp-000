require 'nokogiri'

def get_data
  html = File.read('fixtures/kickstarter.html')
  doc = Nokogiri::HTML(html)
  projects = doc.css(".project-card")
end

def create_project_hash
  hash = {}
  get_data.each do |project|
    title = project.css(".bbcard_name a").text.strip
    image = project.css(".project-thumbnail img").attribute('src').value
    description = project.css(".bbcard_blurb").text.strip
    location = project.css(".project-meta a").attribute("data-location").value.scan(/\w+, \w\w/).first
    funded = project.css(".project-stats li:first-child").children.children.text.to_i

    hash[title] = {
      image_link: image,
      description: description,
      location: location,
      percent_funded: funded
    }
    end
    hash
end
