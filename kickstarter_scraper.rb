require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  doc = Nokogiri::HTML(File.read("./fixtures/kickstarter.html"))
  projects = doc.css(".project-card") #nokogiri array of projects (all details)
  project_names = projects.css(".bbcard_name").css("a") #nokogiri array of project names

  return_hash = {} #placeholder for return_hash - eventually

  #iterates through the nokogiri array of project names and adds titles as keys set to value of empty array
  projects.each do |project|
    return_hash[project.css(".bbcard_name").css("a").text] = {
      description: project.css(".bbcard_blurb").text.strip,
      location: project.css(".project-meta").css("a").text.strip,
      image_link: project.css(".project-thumbnail").css("img").attr("src").text,
      percent_funded: project.css(".project-stats").css(".funded").css("strong").text.to_i
    }
  end

  return_hash

  # TO-DO --> identify css selectors for the various parameters needed, iterate through return hash and add those in as values
  # hashes should look like this in the end:

          ##title => {
              # image_link => link
              # desciption => "description"
              # location => "location"
              # percent_funded => integer
            # }
end
