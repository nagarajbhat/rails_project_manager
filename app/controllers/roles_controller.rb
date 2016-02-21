class RolesController < ApplicationController

	respond_to :html, :json
	def index
	end
	def new
		@role = project.roles.new

		respond_with [project, @role]
	end

	def create
		@role = project.roles.new(role_params)
		new_was_successful = @role.save

		respond_with [project, @role]  do |format|
			format.html {
				if new_was_successful
					redirect_to project_path(project), :notice => "the role was created"
				else
					render 'new'
				end
			}
		end		
	end

	def edit
		@role = project.roles.find(params[:id])

		respond_with [project, @role]
	end

	def update
		@role = project.roles.find(params[:id])
		update_was_successful = @role.update_attributes(role_params)

		respond_with [project, @role]  do |format|
			format.html {
				if update_was_successful
					redirect_to project_path(project), :notice => "the role was saved"
				else
					render 'edit'
				end
			}
		end		
	end

	def destroy
		role= project.roles.find(params[:id ])

		if role.destroy
			flash[:notice] = "role was destroyed"
		else
			flash[:alert] = "role could not be destroyed"
		end

		respond_with [project, @role]  do |format|
			format.html {
				redirect_to project_path(project)
			}
		end	
	end

	
	private

		def project
			@project ||= Project.find(params[:project_id])
		end

		def role_params
			params.require(:role).permit!
		end
end