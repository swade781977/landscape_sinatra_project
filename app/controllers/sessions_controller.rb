class SessionsController < ApplicationController

    get '/login' do
        erb :"sessions/login"
    end

    post '/login' do
        user = User.find_by(email: params[:email]) || User.find_by(username: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:username] = user.username
            session[:email] = user.email
            redirect "/users/#{user.id}"
        else
            redirect '/login'
        end
    end

    get '/logout' do
        sessions.clear
        redirect '/login'
    end
end