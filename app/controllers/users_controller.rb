class UsersController < ApplicationController
	def index
	end

	def edit
		if current_user
			@user = current_user
		# else
		# 	@user = User.new
		# 	@user.build_basic
		end
	end

	def update
		@user = current_user
		@user.build_basic if @user.basic.blank?
		@user.assign_attributes(user_params)
		
		if @user.save
			render 'education'
		else
			render 'edit'
		end
	end

	# def update_education
	# 	@user = current_user
	# 	@user.build_education if @user.education.blank?
	# 	@user.assign_attributes(user_params)
		
	# 	if @user.save
	# 		render 'yolo'
	# 	else
	# 		render 'education'
	# 	end
	# end


	private

	def user_params
    	params.require(:user).permit(basic_attributes: [:full_name, :phone, :linkedin, :twitter, :skype, :personal_website, :_destroy, :id],
    		education_attributes: [:degree, :college, :location, :year_of_grad, :gpa, :_destroy, :id])
    end
end
