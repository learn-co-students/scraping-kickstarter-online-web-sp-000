# require libraries/modules here
  require 'nokogiri'
  require 'pry'

def create_project_hash
  projects = {}
  kickstarter = Nokogiri::HTML(File.read('fixtures/kickstarter.html'))
  kickstarter.css("#projects_list").each do |p_list|
    p_list.css("li").each do |l|
      title = l.css("h2.bbcard_name strong a").text
      #was getting a nil entry from file
      next if title.length == 0 
      image_link = l.css("div.project-thumbnail a img").attribute("src").value
      description = l.css("p.bbcard_blurb").text
      location = l.css("ul.project-meta li a").text
      percent_funded = l.css("ul.project-stats li strong").text.gsub("%","").to_i
      projects[title.to_sym] = { :image_link => image_link,
                                 :description => description,
                                 :location => location,
                                 :percent_funded => percent_funded }
    end
  end
  # binding.pry
  projects
end

# create_project_hash