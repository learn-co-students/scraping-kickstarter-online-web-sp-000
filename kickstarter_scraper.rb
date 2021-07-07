# require libraries/modules here
require 'nokogiri'
require 'pry'


def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  #binding.pry
  
  projects = {}
  
  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text 
    projects[title.to_sym] = { #convert to hash :symbol
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value, :description => project.css("p.bbcard_blurb").text, :location => project.css("ul.project-meta span.location.name").text, :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i 
    }
    
    
    
  end 
  
  projects #rtn proj hash
end


create_project_hash


#reminder, projects live here: 
#kickstarter.css("li.project.grid_4")

#titles live here 
#project.css("h2.bbcard_name strong a").text

#image live here
#project.css("div.project-thumbnail a img").attribute("src").value
#noteworthy.attribute grabs value of attribute w/i html css

#description lives:
#project.css("p.bbcard_blurb").text

#% funded lives:
#project.css("ul.project-stats li.first.funded strong").text 

#% funded to integer for some future processing purpose 
#project.css("ul.project-stats li.first.funded strong").text.gsub("%", "").to_i