class NotesController < ApplicationController 

	get '/notes' do 
			@error_message = params[:error] 
			@user = User.find_by_id(session[:user_id])
			@college = College.find_by_id(params[:id])
			erb :'/notes/index'
	end

	get '/notes/:username/:id/new' do 
			@error_message = params[:error] 
		  redirect_if_not_logged_in
			@college = College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			@user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id).first_or_create
			if params[:captures][0] == current_user.username
  			erb :'/notes/new'
  		else
  			redirect "/notes?error=You are signed in as #{current_user.first_name}. You cannot view or edit another user's notes."
  		end
  end


  get '/notes/:username/:id' do
  		@error_message = params[:error] 
  		redirect_if_not_logged_in
  		@college = College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			if @college.nil? 
				redirect "/notes?error=That college isn't on your list."
			elsif !@user.colleges.ids.include? @college.id
					redirect "/notes?error=That college isn't on your list." 
	 		elsif params[:captures][0] != current_user.username
					redirect "/notes?error=You are signed in as #{current_user.first_name}. You cannot view or edit another user's notes."
			else
					@user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id).first_or_create
					erb :'/notes/show'
				end	 
	end
	
	post '/notes/:username/:id' do
		  redirect_if_not_logged_in
			@college = College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			@user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id).first_or_create
			@user_college.my_notes = params[:user_college][:my_notes]
    	@user_college.save
			erb :'/notes/show'
	end

	get '/notes/:username/:id/edit' do
			@error_message = params[:error]
		  redirect_if_not_logged_in
  		@college = College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			if @college.nil? 
				redirect "/notes?error=That college isn't on your list."
			elsif !@user.colleges.ids.include? @college.id
					redirect "/notes?error=That college isn't on your list." 
	 		elsif params[:captures][0] != current_user.username
					redirect "/notes?error=You are signed in as #{current_user.first_name}. You cannot view or edit another user's notes."
			else
					@user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id).first_or_create
					erb :'/notes/edit'
			end	 
	end

	patch '/notes/:username/:id' do
		  redirect_if_not_logged_in
			@college=College.find_by_id(params[:id])
			@user = User.find_by_id(session[:user_id])
			@user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id).first_or_create
			@user_college.my_notes = params[:user_college][:my_notes]
			@user_college.save
			erb :'/notes/show'
	end

end