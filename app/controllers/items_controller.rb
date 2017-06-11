class ItemsController < ApplicationController

  get '/items' do
    if logged_in?
   erb :'items/items'
  else
    redirect to '/login'
    end
  end

  get '/items/new' do
    if logged_in?
      erb :'items/new'
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
    @item = Item.find(params[:id])
    if logged_in?
      erb :'items/show'
    else
      redirect to '/login'
    end
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    if logged_in? && @item.user_id == session[:user_id]
       erb :'items/edit'
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
      if logged_in? && @item.user_id == session[:user_id]
      @item.delete
        redirect to '/items'
      else
      redirect to '/login'
    end
  end
end
