get '/login' do
  erb :'sessions/new'
end

post '/login' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ["Your username and password didn't match.  Please try again."]
    erb :"sessions/new"
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/sessions_view' do
  @session = session.inspect
  erb :'sessions/show'
end
