class UsersController < ApplicationController
	def index
	end

	def edit_basic
		if current_user.basic.nil?
			@basic = Basic.new
			@basic.user_id = current_user.id
		else
			@basic = current_user.basic
		end
	end

	def edit_experience
		if current_user
			@user = current_user
		else
			redirect_to root
		end
	end

	def edit_skill
		if current_user
			@user = current_user
		else
			redirect_to root
		end
	end

	def edit_education
		if current_user
			@user = current_user
		else
			redirect_to root
		end
	end

	def edit_project
		if current_user
			@user = current_user
		else
			redirect_to root
		end
	end

	def update_basic
		@basic = Basic.new(basic_params)
		@basic.user_id = current_user.id

		if @basic.save
			redirect_to educations_url
		else
			render 'edit_basic'
		end
	end

	def update_education
		@user = current_user
		logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			redirect_to projects_url
		else
			render 'edit_education'
		end
	end

	def update_project
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			redirect_to experiences_url
		else
			render 'edit_project'
		end
	end

	def update_experience
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			redirect_to skills_url
		else
			render 'edit_experience'
		end
	end

	def update_skill
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			render 'yolo'
		else
			render 'edit_skill'
		end
	end


	private

	def user_params
    	params.require(:user).permit(
    		educations_attributes: [:degree, :college, :location, :year_of_grad, :gpa, :_destroy, :id],
    		projects_attributes: [:id, :_destroy, :title, :description],
    		experiences_attributes: [:id, :_destroy, :company, :location, :duration, :role, :description],
    		skills_attributes: [:id, :_destroy, :skill])
    end

    def basic_params
    	params.require(:basic).permit(:full_name, :phone, :linkedin, :twitter, :skype, :personal_website)
    end
end
