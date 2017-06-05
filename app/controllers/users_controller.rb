class UsersController < ApplicationController
  get '/users/:id' do
      @user = User.find_by_id(params[:id])
      erb :'/items/items'
    end


    post '/signup' do
   if params[:username] == "" || params[:password] == ""
     redirect to '/signup'
    else
       @user = User.new(:username => params[:username], :password => params[:password])
       @user.save
       session[:user_id] = @user.id
      redirect to '/items'
    end
   end


    get "/signup" do
      if !logged_in?
        erb :'users/new'
      else
        redirect to '/items/items'
  	end
     end

get '/login' do
   if !logged_in?
     erb :'index'
   else
     redirect to '/items/items'
   end
 end

post '/login' do
   user = User.find_by(:username => params[:username])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect "/items/items"
   else
     redirect to '/index'
   end
 end
end
