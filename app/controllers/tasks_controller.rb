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
    @task = Task.find_by_id(params[:id])
    if @task.user.id == current_user.id
      erb :"tasks/edit"
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
    task = Task.new(params)
    if task.save
      redirect "/tasks/#{task.id}"
    else
      redirect "/tasks/new"
    end
  end

  delete '/tasks/:id' do
    @task = Task.find_by_id(params[:id])
    if @task.user.id == current_user.id
      @task.delete
      redirect "/tasks"
    else
      redirect "/tasks"
    end
  end

end
