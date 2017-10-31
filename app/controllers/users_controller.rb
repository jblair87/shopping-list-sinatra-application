class UsersController < ApplicationController

get '/signup' do
  erb :'users/signup'
end

post '/signup' do
  if params[:username] == "" || params[:password] == ""
 redirect to '/signup'
else
  @user = User.create(params)
session[:user_id] = @user.id
  redirect '/lists'
end
end



get '/login' do
erb :'users/login'
end

post '/login' do
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect '/lists'
   else
     redirect '/signup'
   end
 end


 get '/logout' do
   if session[:user_id] != nil
   session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
 end
end
