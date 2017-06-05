class ItemsController < ApplicationController
  get '/items' do
    if logged_in?
      @items = Item.all
   erb :'items/items'
  else
    redirect to '/login'
    end
  end

  get 'items/create' do
    erb :'items/create'
  end
end

post '/items' do
    @items = Item.create(params[:item])
    if !params[:item][:name].empty?
     @Item.category = Item.create(name: params[:item][:name])
     end
     @item.save
   redirect to "items/#{@item.id}"
    end
