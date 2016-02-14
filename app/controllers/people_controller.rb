class PeopleController < ApplicationController
	def index
		@people = ['luke-skywalker','darth vader']
	end
	def show
		@person = params[:id]
	end
end
