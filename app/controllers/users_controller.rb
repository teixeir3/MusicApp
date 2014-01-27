class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      login_user! @user
      redirect_to user_url @user
    else
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    @user = User.find(params[:id])
  end
end