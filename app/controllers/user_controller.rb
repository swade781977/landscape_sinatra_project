class UserController < ApplicationController
    get '/users' do
        @users= User.all

        erb :'users/index'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        binding.pry
        if @user
            erb :'users/show'
        else
            redirect "/users"
        end
    end
end