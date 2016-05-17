get '/users' do
  redirect '/'
end

get '/users/new' do
  erb :'users/new'
end

post '/users' do
  @user = User.new(params[:user])

  if @user.save
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :'user/new'
  end
end

get '/users/:id' do
  @user = current_user
  erb :'users/show'
end
