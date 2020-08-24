# require libraries/modules here
require 'nokogiri'
require 'pry'
require 'json'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  #it's different syntaxes because this is a local file not using open uri
  kickstarter = Nokogiri::HTML(html) #retunrs xml nodeset
  hugexmlnodeset = kickstarter.css("li.project.grid_4")
  projects = {}

  hugexmlnodeset.each do | project |
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value,
      :description => project.css("p.bbcard_blurb").text,
      :location => project.css("ul.project-meta span.location_name").text,
      :percent_funded => project.css("li.first.funded strong").text.gsub("%", "").to_i
    }
  end
  projects
end

  #each item will be housed under a li: li.project.grid_4
  #inside it, you have the children
  #it actually only has one child, which is div class project-card-wrap
  #that project  card wrap class div has one child: div class project-card
  #project-card is actually the one we're interested in. it has several children: h2, p, etc...
  #to access the nodelist of these children:
  #kickstarter.css("li.project.grid_4").first.children.children.children
  #kickstarter.css("li.project.grid_4").first.children.children.children.class
  #but theres an easier way to find
  #projects =   kickstarter.css("li.project.grid_4")  #this is all projects. 20 of them i believe
  #if we're looping through projects, we're looking at each project (no s)
  #project.css("h2.bbcard_name strong a").text returns "myboyd dick an oratiorio"
  #we found it relatieply painessly by doing further searches
  #as opposed to digging the hiearchy of the nodset sml ourselves
  #project.css("div.project-thumbnail a img").attribute("src").value

  #the first part is an xml nodeset. so we call the attributep roperty on it then the key value inside
  #if i do class it says attribute("src") is a nokigiri xml attr file.
  #it looks likje this :
  ##(Attr:0x121fe0c {
  #name = "src",
  #value = "https://s3.amazonaws.com/ksr/projects/845788/photo-little.jpg?1391022013"}
  #it stores a hash insdiei t. it is not a hash.
  #project.css("h2.bbcard_name span").text returns "\nby\nW4 New Music\n"
  #project.css("p.bbcard_blurb").text retunrs "\nFour young composers join forces with an indie orchestra to present this musical reflection on a literary masterpiece.\n"
  #project.css("li.pledged strong span").text returns "$2,772"
  #project.css("li.first.funded strong").text.gsub("%", "").to_i returns "77%"
  #.gsub("%", "").to_i to remove the percent sign and convert it into an integer.


  #location:
  #project.css("ul.project-meta a").attribute("data-location").value
  #note how theres no s in attribute
  #weird because this is the structure
  # #<Nokogiri::XML::Element:0x1225de8 name="a" attributes=[
  ##<Nokogiri::XML::Attr:0x1225d84 name="data-location" value="blah blah blah"">,
  # #<Nokogiri::XML::Attr:0x1225d70 name="href" value="/discover/places/brooklyn-ny?ref=city">,
  # #<Nokogiri::XML::Attr:0x1225d5c name="target">
  #  ]
  #thats the inside of attributes=[]
  #but anyway it returns
  #"{\"id\":12589335,\"name\":\"Brooklyn\",\"slug\":\"brooklyn-ny\",\"short_name\":\"Brooklyn, NY\",\"displa
  #etc..
  #how do i turn this into somethin useable
  #this looks like a json or something. don't Remember. not even a js obejct
  #first u require 'json' above
  #then do
  # longthing = project.css("ul.project-meta a").attribute("data-location").value
  #my_hash = JSON.parse(longthing)
  #my_hash["short_name"] returns "Brooklyn, NY"
  #never mind, i'm so stupid
  #down below it clearly says in the span Brooklyn ny. just do
  #project.css("ul.project-meta span.location_name").text



# create_project_hash
