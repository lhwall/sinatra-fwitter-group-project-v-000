require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
end


 get "/signup" do
   erb :"users/create_user"
 end

 post "/signup" do
   #binding.pry
   if params[:username] == "" || params[:password] == ""
     post "/signup"
  else
  @user = User.new(:username => params[:username], :password => params[:password], :email =>params[:email])
  @user.save
  session[:id] = @user.id
  redirect to "/tweets/tweets"
end
 end

 get "/login" do
   erb :login
 end

end
