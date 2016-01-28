class UsersController < ApplicationController
	def index
	end

	def edit_basic
		if current_user
			@basic = current_user.basic || current_user.build_basic
			@user = current_user
			respond_to do |format|
			    format.html {}
			    format.js { render 'basic'}
			end
		else
			redirect_to root
		end
	end

	def edit_experience
		ajax_call_to_form
	end

	def edit_skill
		ajax_call_to_form
	end

	def edit_education
		ajax_call_to_form
	end

	def edit_project
		ajax_call_to_form
	end

	def update_basic
		@basic = current_user.basic || current_user.build_basic
		@user = current_user
		if @basic.update(basic_params)	
			@status = "Education"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			@status = "Basic"
			respond_to do |format|
			    format.html {}
			    format.js { render 'basic'}
			end
		end
	end

	def update_education
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			@status = "Project"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			@status = "Education"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		end
	end

	def update_project
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			@status = "Experience"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			@status = "Project"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		end
	end

	def update_experience
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			@status = "Skill"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			@status = "Experience"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		end
	end

	def update_skill
		@user = current_user
		# logger.info('--------' + user_params.to_s + '--------')
		if @user.update(user_params)
			@status = "Done"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			@status = "Skill"
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		end
	end


	private

	def user_params
    	params.require(:user).permit(
    		educations_attributes: [:id, :degree, :college, :location, :year_of_grad, :gpa, :_destroy],
    		projects_attributes: [:id, :title, :description, :_destroy],
    		experiences_attributes: [:id, :company, :location, :duration, :role, :description, :_destroy],
    		skills_attributes: [:id, :skill, :_destroy])
    end

    def basic_params
    	params.require(:basic).permit(:full_name, :phone, :linkedin, :twitter, :skype, :personal_website)
    end

    def ajax_call_to_form 
    	@status = params[:data]
		if current_user
			@user = current_user
			respond_to do |format|
			    format.html {}
			    format.js { render 'next_page'}
			end
		else
			redirect_to root
		end
    end
end
