# require libraries/modules here
require 'nokogiri'
require 'pry'


def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css('li.project.grid_4').each do |project|
    title = project.css('h2.bbcard_name strong a').text
    projects[title.to_sym] = {
      # METHOD 1
      image_link: project.css('div.project-thumbnail a img').attribute('src').value,
      description: project.css('p.bbcard_blurb').text,
      location: project.css('span.location-name').text,
      percent_funded: project.css('li.first.funded strong').text.gsub("%","").to_i

      # METHOD 2
      # :image_link => project.css('div.project-thumbnail a img').attribute('src').value,
      # :description => project.css('p.bbcard_blurb').text,
      # :location => project.css('span.location-name').text,
      # :percent_funded => project.css('li.first.funded strong').text.gsub("%","").to_i
    }
    # METHOD 3
    # projects[title.to_sym][:image_link] = project.css('div.project-thumbnail a img').attribute('src').value
    # projects[title.to_sym][:description] = project.css('p.bbcard_blurb').text
    # projects[title.to_sym][:location] = project.css('span.location-name').text
    # projects[title.to_sym][:percent_funded] = project.css('li.first.funded strong').text.gsub("%","").to_i

  end

  projects
end

create_project_hash
# projects: kickstarter.css('li.project.grid_4')
# title: project.css('h2.bbcard_name strong a').text
# image link: project.css('div.project-thumbnail a img').attribute('src').value
# description: project.css('p.bbcard_blurb').text
# location: project.css('span.location-name').text
# percent_funded: project.css('li.first.funded strong').text.gsub("%","").to_i
