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

# def add_project(projects)
# 	click_link "Project"
# 	expect(page).to have_content "add project"
# 	educations.count.times do |x|
# 		click_link "add project"
# 		find("input[id$=_degree]", match: :first)
# 		all("input[id$=_degree]").last.set(educations[x].degree)
# 		all("input[id$=_college]").last.set(educations[x].college)
# 		all("input[id$=_location]").last.set(educations[x].location)
# 		all("input[id$=_grad]").last.set(educations[x].year_of_grad)
# 		all("input[id$=_gpa]").last.set(educations[x].gpa)
# 	end
# 	click_button "Update Education"
# 	expect(page).to have_content "add project"
# end


def initialize_account
	sign_up
	logout
	sign_in("yolo@cadfgg.com", "password")
end
