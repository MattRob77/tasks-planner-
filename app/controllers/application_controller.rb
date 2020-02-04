require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #HTTP session cookie Can now presist data, remember things also comes with helper methods
    set :session_secret, "administrator" #Set in environment file-git
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])# ||= prevents having to keep looking up user 
    end
  end
end
