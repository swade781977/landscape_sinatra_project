class UserController < ApplicationController
    get '/users' do
        @users= User.all

        erb :'users/index'
    end

    get '/users/new' do
        erb :'users/new'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        if @user
            erb :'users/show'
        else
            redirect "/users"
        end
    end

   

    post '/users' do
        binding.pry
        @user = User.create(params)
        redirect "/users/#{@user.id}"
    end
end