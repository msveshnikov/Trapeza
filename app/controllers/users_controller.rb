class UsersController < ApplicationController
  before_action :admin_user, :check_for_mobile

  # GET /users
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def admin_user
    redirect_to(root_url) unless current_user && current_user.id==1
  end

end
