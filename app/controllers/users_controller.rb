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

  def activate
    @user = User.find_by_activation_token(params[:activation_token])

    if @user
      @user.activate!
      redirect_to @user, notice: "Successfully activated your account!"
    else
      raise ActiveRecord::RecordNotFound.new() unless @user
    end
  end

end
