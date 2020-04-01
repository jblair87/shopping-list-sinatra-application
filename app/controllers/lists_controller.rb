require 'rack-flash'

class ListsController < ApplicationController
  use Rack::Flash

  get '/lists' do
    if logged_in?
       @lists = List.all
   erb :'lists/lists'
  else
    redirect to '/login'
    end
  end

  get '/lists/new' do
       @items = current_user.items
      erb :'lists/new'
  end

  post '/lists' do
    @list = List.create(params[:list])
      @list.save
      flash[:message] = "Successfully created list."
      redirect '/lists'
  end

  get '/lists/:id' do
    #dynamic url route
    @list = List.find(params[:id])
      erb :'lists/show'
  end

  get '/lists/:id/edit' do
    if logged_in?
    @list = List.find(params[:id])
    if @list && @list.user == current_user
    erb :'/lists/edit'
  else
    redirect '/lists'
end
else
   redirect to '/login'
end
  end

  post '/lists/:id' do
    @list = List.find(params[:id])
    @list.update(params["list"])
    redirect to "lists/#{@list.id}"
  end

  delete '/lists/:id' do
  if logged_in?
	@list = List.find(params[:id])
  if @list && @list.user == current_user
	@list.destroy
end
	redirect '/lists'
else
      redirect to '/login'
    end
  end
end
