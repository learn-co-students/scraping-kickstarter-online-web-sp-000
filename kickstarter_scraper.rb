require "nokogiri"
require "pry"

# class Project
#   attr_accessor :name, :link, :description, :location, :percent_funded
#
#   @@all = {}
#
#   def initialize
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
# end
#
# def get_page
#   Nokogiri::HTML(File.read('fixtures/kickstarter.html'))
# end
#
# def get_projects
#   get_page.css(".project-card")
# end
#
# def create_projects
#   get_projects.each {|proj|
#     project = Project.new
#     project.name = proj.css("bbcard_name").children[0].text
#     project.
#     project.description = proj.css("bbcard_blurb").text
#   }
# end

def get_projects
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  kickstarter.css("li.project.grid_4")
end

def create_project_hash
  projects = {}
  get_projects.each {|project|
    name = project.css("h2.bbcard_name strong a").text.to_sym
    projects[name] = {
      image_link: project.css("div.project-thumbnail a img").attribute("src").value,
      description: project.css("p.bbcard_blurb").text,
      location: project.css("ul.project-meta li a span.location-name").text,
      percent_funded: project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i
    }
  }
  projects
  # binding.pry
  # projects: kickstarter.css("li.project.grid_4").first
  # name: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # description: project.css("p.bbcard_blurb").text
  # location: project.css("ul.project-meta li a span.location-name").text
  # funded: project.css("ul.project-stats li.first.funded strong").text
  # author: project.css("h2.bbcard_name span").text.strip

end

create_project_hash
