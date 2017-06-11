class CategoriesController < ApplicationController
  get '/categories' do
    if logged_in?
      @user = current_user
  erb :'categories/categories'
else
  redirect to '/login'
end
end

get '/categories/new' do
  if logged_in?
  erb :'categories/new'
else
  redirect to 'login'
end
end

post '/categories' do
  if params.values.any? {|value| value == ""}
   redirect to "/categories/new"
 else
    user = User.find(session[:user_id])
   @category = Category.create(name: params[:name])
  redirect to "/categories/#{@category.id}"
 end
end

get '/categories/:id' do
  @category = Category.find(params[:id])
  if logged_in?
    erb :'categories/show'
  else
    redirect to '/login'
  end
end

get '/categories/:id/edit' do
  @category = Category.find(params[:id])
  if logged_in? && @category.user_id == session[:user_id]
     erb :'categories/edit'
    else
    redirect to '/login'
  end
end

patch '/categories/:id' do
  if params[:name] == ""
    redirect to "/categories/#{params[:id]}/edit"
  else
    @category = Category.find(params[:id])
    @category.name = params[:name]
    @category.save
    redirect to "/categories/#{@category.id}"
  end
end

delete '/categories/:id/delete' do
    @category = Category.find(params[:id])
    if logged_in? && @category.user_id == session[:user_id]
    @category.delete
      redirect to '/categories'
    else
    redirect to '/login'
  end
end
end
