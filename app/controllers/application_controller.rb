require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
end

  get "/index" do
    erb :index
  end

 get "/signup" do
   erb :"users/create_user"
 end

 post "/signup" do
  @user = User.create(:username => params[:username], :password => params[:password])
  session[:id] = @user.id
  erb :"/tweets/tweets"
 end

 get "/login" do
   erb :login
 end

end
