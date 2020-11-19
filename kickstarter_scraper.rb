require "nokogiri"

def create_project_hash
	doc = Nokogiri::HTML(File.read("./fixtures/kickstarter.html"))

	Hash.new.tap do |hash|
		doc.css("#projects_list .project.grid_4").each do |project|
			hash[project.css(".bbcard_name strong a").text.strip.to_sym] = {
				image_link: project.css(".project-thumbnail a img").attribute("src").value,
				description: project.css(".bbcard_blurb").text.strip,
				location: project.css(".project-meta li a .location-name").text.strip,
				percent_funded: project.css(".project-stats .first.funded strong").text.strip[0...-1].to_i
			}
		end
	end
end
