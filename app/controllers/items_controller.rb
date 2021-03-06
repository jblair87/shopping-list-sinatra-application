class ItemsController < ApplicationController

  get '/items' do
    if logged_in?
      @items = current_user.items
   erb :'/items'
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
        @item = Item.create(params[:item])
        @item.save
        redirect to "/items/#{@item.id}"
 end

  get '/items/:id' do
    #dynamic url route
    @item = Item.find(params[:id])
      erb :'/items/show'
  end


post '/items/:id' do
   @item = Item.find(params[:id])
   @item.update(params["item"])
   redirect to "items/#{@item.id}"
 end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
       erb :'/items/edit'
  end

  patch '/items/:id' do
    @item = Item.find_by(id: params[:id])
    if @items
      redirect to "/items/#{params[:id]}/edit"
    else
      @item = Item.find_by(params[:id])
      @item.name = params[:name]
      @item.save
      redirect to "/items/#{@item.id}"
    end
  end

  delete '/items/:id' do
	@item = Item.find(params[:id])
	@item.destroy
	redirect '/'
end

end
