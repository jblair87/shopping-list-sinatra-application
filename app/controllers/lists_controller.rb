class ListsController < ApplicationController
  get '/lists' do
    if logged_in?
   erb :'lists/lists'
  else
    redirect to '/login'
    end
  end

  get '/lists/new' do
    if logged_in?
      erb :'lists/new'
    else
      redirect to '/login'
    end
  end

  post '/lists' do
    if params.values.any? {|value| value == ""}
     redirect to "/lists/new"
   else
      @list = current_user.lists.create(name: params[:name])
    redirect to "/lists/#{@list.id}"
   end
  end

  get '/lists/:id' do
    @list = current_user.lists.find_by(id: params[:id])
    if @list
      erb :'lists/show'
    else
      redirect to '/login'
    end
  end

  get '/lists/:id/edit' do
    @list = current_user.lists.find_by(id: params[:id])
    if @list
       erb :'lists/edit'
      else
      redirect to '/lists'
    end
  end



  delete '/lists/:id/delete' do
      @list = List.find_by(params[:id])
      if logged_in? 
      @list.delete
        redirect to '/lists'
      else
      redirect to '/login'
    end
  end


end
