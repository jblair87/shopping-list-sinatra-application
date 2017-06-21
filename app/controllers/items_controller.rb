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
    if logged_in?
      unless params[:name].empty? || params[:category_id].empty? || params[:list_id].empty?
        @item = Item.create(params)
        redirect to "/items/#{@item.id}"
   else
   redirect to "/items/new"
 end
 redirect '/login'
   end
 end

  get '/items/:id' do
    @item = current_user.items.find_by(id: params[:id])
    if @item
      erb :'items/show'
    else
      redirect to '/login'
    end
  end

  get '/items/:id/edit' do
    @item = current_user.items.find_by(id: params[:id])
    if @item
       erb :'items/edit'
      else
      redirect to '/items'
    end
  end

  patch '/items/:id' do
    @item = current_user.items.find_by(id: params[:id])
    if @items
      redirect to "/items/#{params[:id]}/edit"
    else
      @item = Item.find_by(params[:id])
      @item.name = params[:name]
      @item.quantity = params[:quantity]
      @item.save
      redirect to "/items/#{@item.id}"
    end
  end

  delete '/items/:id/delete' do
      @item = Item.find_by_id(params[:id])
      if logged_in? && @item.user_id == session[:user_id]
      @item.delete
        redirect to '/items'
      else
      redirect to '/login'
    end
  end
end
