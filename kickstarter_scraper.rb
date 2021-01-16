require "nokogiri"
require "pry"

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  #set var 'html' as contents within static website file 
  
  kickstarter = Nokogiri::HTML(html)
 #set var kickstarter as the code within file above
 
  projects = {}
 #create empty hash to store following items 
 
  kickstarter.css("li.project.grid_4").each do |project|
    #go through all elements assigned to website section specified 
    title = project.css("h2.bbcard_name strong a").text
    #create new value as title
    
    projects[title.to_sym] = {
      #turn title into a symbol, push new content into hash
      
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      #set symbol and its value as what found on css code 
      
      :description => project.css("p.bbcard_blurb").text,
      #set description symbol and value as text found within
      
      :location => project.css("ul.project-meta span.location-name").text,
       #same idea as above with location as symbol 
       
      :percent_funded => project.css("ul.project-stats li.first.funded strong").text.gsub("%","").to_i
      #same, with parentheses removed so we can use as int var
    }
  end

  projects
  #return the project hash created 
end
