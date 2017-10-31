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
       @items = Item.all
      erb :'lists/new'
  end

  post '/lists' do
    @list = List.create(params[:list])
    if !params["item"]["name"].empty?
    @list.items << Item.create(name: params["item"]["name"])
  end
      @list.save
      flash[:message] = "Successfully created list."
      redirect to("/lists/#{@list.id}")
  end

  get '/lists/:id' do
    @list = List.find(params[:id])
      erb :'/lists/show'
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

  delete '/lists/:id/delete' do
      if logged_in?
        @list = List.find_by(params[:id])
        if @list.user_id == current_user.id

      @list.delete
        redirect to '/lists'
      else
      redirect to '/lists'
    end
  else
        redirect to '/login'
  end
end
end
