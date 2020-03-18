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
    @list = List.find(params[:id])
      erb :'lists/show'
  end

  get '/lists/:id/edit' do
    @list = List.find(params[:id])
    erb :'/lists/edit'
  end

  post '/lists/:id' do
    @list = List.find(params[:id])
    @list.update(params["list"])
    redirect to "lists/#{@list.id}"
  end

  delete '/lists/:id' do
	@list = List.find(params[:id])
	@list.destroy
	redirect '/lists'
end
end
