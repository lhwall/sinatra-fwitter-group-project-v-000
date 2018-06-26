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
   if params[:username].empty? || params[:password].empty?
     erb :"users/create_user"
  else
  @user = User.create(:username => params[:username], :password => params[:password])
  session[:id] = @user.id
  redirect to "/tweets/tweets"
end
 end

 get "/login" do
   erb :login
 end

end
