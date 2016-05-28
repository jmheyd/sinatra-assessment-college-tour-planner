 class SessionsController < ApplicationController

	get '/login' do
		 @error_message = params[:error]
		if logged_in?
			redirect '/colleges'
		else
 			erb :'/users/login'
 		end
 	end

	post '/login' do
 		@user = User.find_by(:username => params[:username])
 		if @user && @user.authenticate(params[:password])
 			session[:user_id] = @user.id
 			redirect '/colleges'
 		elsif params[:username] == "" || params[:password] == ""
 			redirect '/login?error=You need both username and email to login.'
 		else
 			redirect to '/signup'
 		end
 	end

 	get '/logout' do
 		if logged_in?
 			session.clear
 			redirect '/'
 		else
 			redirect '/'
 		end
 	end

end

