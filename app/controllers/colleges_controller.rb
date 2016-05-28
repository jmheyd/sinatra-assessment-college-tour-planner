class CollegesController < ApplicationController 

	get '/colleges' do
			redirect_if_not_logged_in
			@error_message = params[:error]
			@colleges = College.all
			@user = User.find_by_id(session[:user_id])
			erb :'/colleges/index'
	end

	get '/colleges/new' do
		@user = User.find_by_id(session[:user_id])
		redirect_if_not_logged_in 
    @error_message = params[:error]
		erb :'/colleges/new'
	end

	post '/colleges' do #create college
		redirect_if_not_logged_in 
		#binding.pry

		@user = User.find_by_id(session[:user_id])
		 unless College.valid_params?(params)
      redirect "/colleges/new?error=Incomplete college information. Please fill out entire form."
    end
		@college = College.create(params[:college])
		@college.save
		erb :'/colleges/show'
	end

	get '/colleges/:id' do
		redirect_if_not_logged_in 
		@college = College.find_by_id(params[:id])
		@user = User.find_by_id(session[:user_id])
		erb :'/colleges/show'
	end

	get '/colleges/:id/edit' do
		redirect_if_not_logged_in 
			@college =College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			erb :'/colleges/edit'
	end

	patch '/colleges/:id' do
		@college=College.find_by_id(params[:id])
		@college.update(params[:college])
		@college.save
		@user = User.find_by_id(session[:user_id])
	erb :'/colleges/show'
	end

	
end
