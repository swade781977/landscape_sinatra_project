class UserController < ApplicationController
    get '/users' do
        @users= User.all

        erb :'users/index'
    end

    get 'users/:id' do
        @user= 
end