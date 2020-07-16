class UserController < ApplicationController
    get '/users' do
        @users= User.all

        erb :'/users/index'
    end

    get '/users/new' do
        erb :'/users/new'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        if @user
            erb :'/users/show'
        else
            redirect "/users"
        end
    end

    get '/users/:id/edit' do 
        @user = User.find_by_id(params[:id])
        if @user
            erb :'/users/edit'
        else
            redirect "/users"
        end
    end

    post '/users' do
        binding.pry
        @user = User.create(params)
        redirect "/users/#{@user.id}"
    end

    patch '/users/:id' do
        @user = User.find_by_id(params[:id])
        binding.pry
        if @user.update(name: params[:name], email: params[:email], username: params[:username], password_digest: params[:password_digest])
            redirect "/users/#{@user.id}"
        else
            redirect "/users/#{@user.id}/edit"
        end
    end
end