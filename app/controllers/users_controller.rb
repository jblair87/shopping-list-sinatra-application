class UsersController < ApplicationController

get '/signup' do
   if !logged_in?
     erb :'users/new'
    else
      redirect to 'users/list'
   end
end

post '/signup' do
if params[:username] == "" || params[:password] == ""
redirect to signup
else
  @user = User.new(:username => params[:username], :password => params[:password])
session[:user_id] = @user.id
    redirect 'user/list'
end
end
get '/login' do
   if !logged_in?
     erb :'users/login'
   else
     redirect to 'users/list'
   end
 end
