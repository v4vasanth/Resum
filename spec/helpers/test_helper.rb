def sign_up
	  	visit 'users/sign_up'
	  	fill_in "user_username", :with => "yolo"
		fill_in "user_email", :with => "yolo@cadfgg.com"
		fill_in "user_password", :with => "password"
		fill_in "user_password_confirmation", :with => "password"
	  	click_button "sign_up"
	  	expect(page).to have_content "Basic User Information"
end

def sign_in (email, password)
	visit 'users/sign_in'
	fill_in "user_email", with: email
	fill_in "user_password", with: password
	click_button "login"
	expect(page).to have_content "Basic User Information"
end

def logout
	click_link "Logout"
	expect(page).to have_content "Start your Journey"
end

def fill_basic(basic)
	click_link "Basic"
	expect(page).to have_content "Basic User Information"
	fill_in "Full Name", with: basic.full_name
	fill_in "Phone Number", with: basic.phone
	click_button "Update Basic Information"
	expect(page).to have_content "add education"
end

def add_education(educations)
	click_link "Education"
	expect(page).to have_content "add education"
	educations.count.times do |x|
		click_link "add education"
		find("input[id$=_degree]", match: :first)
		all("input[id$=_degree]").last.set(educations[x].degree)
		all("input[id$=_college]").last.set(educations[x].college)
		all("input[id$=_location]").last.set(educations[x].location)
		all("input[id$=_grad]").last.set(educations[x].year_of_grad)
		all("input[id$=_gpa]").last.set(educations[x].gpa)
	end
	click_button "Update Education"
	expect(page).to have_content "add project"
end

def add_project(projects)
	click_link "Project"
	expect(page).to have_content "add project"
	projects.count.times do |x|
		click_link "add project"
		find("[id$=_title]", match: :first)
		all("[id$=_title]").last.set(projects[x].title)
		all("[id$=_description]").last.set(projects[x].description)
	end
	click_button "Update Project"
	expect(page).to have_content "add experience"
end

def add_experience(experiences)
	click_link "Experience"
	expect(page).to have_content "add experience"
	experiences.count.times do |x|
		click_link "add experience"
		find("input[id$=_company]", match: :first)
		all("input[id$=_company]").last.set(experiences[x].company)
		all("input[id$=_location]").last.set(experiences[x].location)
		all("input[id$=_duration]").last.set(experiences[x].duration)
		all("input[id$=_role]").last.set(experiences[x].role)
		all("[id$=_description]").last.set(experiences[x].description)
	end
	click_button "Update Experience"
	expect(page).to have_content "add experience"
end

def add_skill(skills)
	click_link "Skill"
	expect(page).to have_content "add skill"
	skills.count.times do |x|
		click_link "add skill"
		find("[id$=_skill]", match: :first)
		all("[id$=_skill]").last.set(skills[x].skill)
	end
	click_button "Update Skill"
	expect(page).to have_content "add skill"
end


def initialize_account
	sign_up
	logout
	sign_in("yolo@cadfgg.com", "password")
end

def breakpoint
	logout
	sign_in("yolo@cadfgg.com", "password")
end