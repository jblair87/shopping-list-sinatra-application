class UsersController < ApplicationController
  get '/users/:id' do
    @user = User.find(params[:id])
     if !logged_in?
       redirect '/lists'
     end

     if !@user.nil? && @user == current_user
       erb:'users/show'
     else
       redirect '/lists'
     end
   end


   get '/signup' do
     if !logged_in?
        erb:'users/signup'
      else
        redirect to '/lists'
      end
    end

post '/signup' do
  if params[:username] == "" || params[:password] == ""
 redirect to 'users/signup'
else
  @user = User.new(:username => params[:username], :password => params[:password])
  if @user.save
         session[:user_id] = @user.id
  redirect '/lists'
else
  erb:'users/signup'
end
end
end




get '/login' do
  if !logged_in?
        erb:'users/login'
      else
        redirect to '/lists'
      end
    end


post '/login' do
   @user = User.find_by(username: params[:username])
   if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     redirect '/lists'
   else
     redirect 'users/signup'
   end
 end


 get '/logout' do
   if logged_in?
   session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
 end
end
