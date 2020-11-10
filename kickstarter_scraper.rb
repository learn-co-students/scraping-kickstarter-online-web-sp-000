require 'nokogiri'
require 'pry'

def create_project_hash
  doc = Nokogiri::HTML(File.read("./fixtures/kickstarter.html"))
  projects = doc.css(".project-card")

  return_hash = {}

  projects.each do |project|
    return_hash[project.css(".bbcard_name").css("a").text] = {
      description: project.css(".bbcard_blurb").text.strip,
      location: project.css(".project-meta").css("a").text.strip,
      image_link: project.css(".project-thumbnail").css("img").attr("src").text,
      percent_funded: project.css(".project-stats").css(".funded").css("strong").text.to_i
    }
  end

  return_hash

end
