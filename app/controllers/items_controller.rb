class ItemsController < ApplicationController

  get '/items' do
    if logged_in?
      @items = Item.all
   erb :'items/items'
  else
    redirect to '/login'
    end
  end

  get '/items/create' do
    if logged_in?
      erb :'items/create'
    else
      redirect to '/login'
    end
  end

  post '/items' do
    if params.values.any? {|value| value == ""}
     redirect to "/items/new"
   else
      user = User.find(session[:user_id])
     @item = Item.create(name: params[:name], quantity: params[:quantity])
    redirect to "/items/#{@item.id}"
   end
 end

  get '/items/:id' do
    if logged_in?
      @item = Item.find(params[:id])
      erb :'items/show'
    else
      redirect to '/login'
    end
  end

  get '/items/:id/edit' do
    if logged_in?
      @item = Item.find(params[:id])
      if @item.user_id == session[:user_id]
       erb :'items/edit'
      else
        redirect to '/items'
      end
    else
      redirect to '/login'
    end
  end

  patch '/items/:id' do
    if params[:name] == ""
      redirect to "/items/#{params[:id]}/edit"
    else
      @item = Item.find(params[:id])
      @item.name = params[:name]
      @item.quantity = params[:quantity]
      @item.save
      redirect to "/items/#{@item.id}"
    end
  end

  delete '/items/:id/delete' do
      @item = Item.find(params[:id])
      if session[:user_id]
            @item = Item.find(params[:id])
  if @project.user_id == session[:user_id]
      @item.delete
        redirect to '/items'
      else
        redirect to '/items'
      end
    else
      redirect to '/login'
    end
  end
end
