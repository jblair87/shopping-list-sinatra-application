class UsersController < ApplicationController
  get '/users/:id' do
     if !logged_in?
       redirect '/lists'
     end

     @user = User.find(params[:id])
     if !@user.nil? && @user == current_user
       erb :'users/show'
     else
       redirect '/lists'
     end
   end


   get '/signup' do
     if !session[:user_id]
        erb :'users/signup'
      else
        redirect to '/items'
      end
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
  if !session[:user_id]
        erb :'users/login'
      else
        redirect '/lists'
      end
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
