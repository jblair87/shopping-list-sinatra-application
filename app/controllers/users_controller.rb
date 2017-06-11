class UsersController < ApplicationController

get '/signup' do
  erb :'users/signup'
end

post '/signup' do
if params[:username] == "" || params[:password] == ""
 redirect to '/signup'
else
  user = User.create(params)
session[:user_id] = user.id
  redirect to '/categories'
end
end



get '/login' do
  if !logged_in?
  erb :'users/login'
else
  redirect to '/categories'
end
end

post '/login' do
   user = User.find_by(:username => params[:username])
   if user && user.authenticate(params[:password])
     session[:user_id] = user.id
     redirect '/categories'
   else
     erb :'users/login'
   end
 end


 get '/logout' do
   session.clear
      redirect to '/login'
 end
end
