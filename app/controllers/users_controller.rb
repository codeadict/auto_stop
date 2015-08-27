class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to :admin_clientes_path
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end
