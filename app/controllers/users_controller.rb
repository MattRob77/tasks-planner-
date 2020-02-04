class UsersController < ApplicationController
  #UserController user create method

  get '/users/signup' do
    erb :'/users/signup'
  end

  post '/users' do
      user = User.new(params)
      if user.save
        session[:user_id] = user.id
        redirect "/tasks"
      else
        redirect "/users/signup"
      end
    end
end
