def current_user
  @current_user || User.find(session[:user_id])
end

def user_logged_in?
  session[:user_id] != nil
end

def authorize
  if user_logged_in? == false
    @errors = ['Please log in to perform that action']
    erb :'sessions/new'
  end
end
