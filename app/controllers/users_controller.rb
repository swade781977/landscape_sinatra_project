class UsersController < ApplicationController
   
    before do
        unless logged_in? || request.path_info == "/login"
            puts "NOT LOGGED IN ACCESS DENIED !!!!"
            redirect '/'
        end
    
    end
   
    get '/users' do
        @users= User.all
        erb :'/users/index'
    end

    get '/users/new' do
        erb :'/users/new'
    end

    get '/users/:id' do
        @user = current_user
        if @user
            erb :'/users/show'
        else
            redirect "/users"
        end
    end

    get '/users/:id/edit' do 
        @user = current_user
        if @user
            erb :'/users/edit'
        else
            redirect "/users"
        end
    end

    post '/users' do
        @user = User.build(params)
        if @user.save
            redirect "/users/#{@user.id}"
        else
            puts "User Record Not Created Please Try Again"
            redirect "/users/new"
        end
    end

    patch '/users/:id' do
        @user = current_user
        if @user.update(name: params[:name], email: params[:email], username: params[:username], password_digest: params[:password_digest])
            redirect "/users/#{@user.id}"
        else
            redirect "/users/#{@user.id}/edit"
        end
    end

    delete '/users/:id' do
        user = User.find_by_id(params[:id])
        if user
            user.delete
        end
        redirect '/users'
    end
end