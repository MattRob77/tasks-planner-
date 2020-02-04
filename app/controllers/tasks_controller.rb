class TasksController < ApplicationController
  get '/tasks' do
    if logged_in?
      @tasks = Task.all
      erb :"tasks/index"
    else
      redirect "/login"
    end
  end

  get '/tasks/new' do
    @users =User.all
    erb :"tasks/new"
  end

  get '/tasks/:id/edit' do
    @users = User.all
    @task = Task.find_by_id(params[:id]) #Checked the user.id against the current user
    if @task.user.id == current_user.id #Security Authentication
      erb :"tasks/edit" #Keeps other users from being able to edit other users data
    else
      redirect :"/tasks"
    end
  end



  patch '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    params.delete("_method")
    if @task.update(params)
      redirect "/tasks/#{@task.id}"
    else
      redirect "/tasks/#{@task.id}/edit"
    end
  end

  get '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    erb :"tasks/show"
  end

  post '/tasks' do
    task = Task.new(title: params[:title], body: params[:body], user_id: current_user.id)
    if task.save
      redirect "/tasks/#{task.id}"
    else
      redirect "/tasks/new"
    end
  end

  delete '/tasks/:id' do
    @task = Task.find_by_id(params[:id]) #Only user can delete data
    if @task.user.id == current_user.id
      @task.delete #active record method
      redirect "/tasks"
    else
      redirect "/tasks"
    end
  end

end
