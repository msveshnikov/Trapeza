class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to recipe_path(Recipe.find(session[:recipe_id]))
  end

  def destroy
    session[:user_id] = nil
    redirect_to recipe_path(Recipe.find(session[:recipe_id]))
  end
end
