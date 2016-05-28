class UsersController < ApplicationController 

	get '/signup' do 
        @error_message = params[:error]
        if logged_in?
          redirect '/colleges'
        else 
		  erb :'/users/create_user'	
        end	
	end

	post '/signup' do
        @error_message = params[:error]
        if params[:username] == "" || params[:password] == "" || params[:first_name] == "" || params[:last_name] == "" || params[:email] == ""
            redirect to '/signup?error=You need first name, last name, username, email and password to sign up.'
        else
            @user = User.create(params)
            session[:user_id] = @user.id
            @user.save
            redirect '/colleges'          
        end
 	end

    get '/users' do
        @error_message = params[:error]
        @user = User.find_by_id(session[:user_id])
        erb :'/users/index'
    end

    get '/users/:username' do
        @error_message = params[:error]
        redirect_if_not_logged_in 
        @colleges = College.all
        @college = College.find_by_id(params[:id])
        @user = User.find_by_id(session[:user_id])
        if params[:captures][0] == current_user.username
            if !@user.colleges.empty?
                erb :'/users/show_list'
            else
                erb :'/users/new_list'
            end
        else
            redirect "/users?error=You are logged in as #{current_user.first_name}. You cannot view or edit another user's list"
        end
    end

    get '/users/:username/edit' do 
        @error_message = params[:error]
        redirect_if_not_logged_in 
        @colleges = College.all
        @user = User.find_by_id(session[:user_id])
        @college = College.find_by_id(params[:id])
        if params[:captures][0] == current_user.username
            erb :'/users/edit_list'
        else
            redirect "/users?error=You are signed in as #{current_user.first_name}. You cannot view or edit another user's list"
        end
    end

    patch '/users/:username' do
        @user = User.find_by_id(session[:user_id])
        @college = College.find_by_id(params[:id])
        @user.update(params[:user])
        erb :'/users/show_list'
    end

    post '/users/:username' do
        @user = User.find_by_id(session[:user_id])
        @user.update(params[:user])
        @user.save
        erb :'/users/show_list'
    end

    get '/users/:username/:id' do
        @user = User.find_by_id(session[:user_id])
        @college = College.find_by_id(params[:id])
        erb :'/users/show_college'
    end

    post '/users/:username/:id' do 
        @user = User.find_by_id(session[:user_id])
        @college = College.find_by_id(params[:id])
        @user_college = UserCollege.where(:college_id => @college.id, :user_id => @user.id)
        erb :'/users/show_college'
    end

    

end