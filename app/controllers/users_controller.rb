class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.activation_email(@user).deliver!
      redirect_to root_url, notice: "Successfully created your account! Check your inbox for an activation email."
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

    # Check for presence of activation token in params to prevent
    # fetching a user from the db that has a nil activation_token
    # for some reason.
    if params[:activation_token] && @user
      @user.activate!
      login_user! @user
      redirect_to @user, notice: "Successfully activated your account!"
    else
      raise ActiveRecord::RecordNotFound.new()
    end
  end

end
