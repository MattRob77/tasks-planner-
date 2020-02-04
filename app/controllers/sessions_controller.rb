class SessionsController < ApplicationController
  #SessionsController Login 

  get '/login' do
    erb :'sessions/login'
  end

  post '/login' do #Route
    user = User.find_by(name: params[:name]) #User model finds the specific user when submits form
    if user && user.authenticate(params[:password]) #bcrypt authenticate/method && evaluates both sides as true so it's not nil
      session[:user_id] = user.id #Sets their session ID to the same as user ID
      redirect "/tasks"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect "login"

  end

end
