class UsersController < ApplicationController
  before_action :authenticate_user!
    def index
      @users = User.all
      @book = Book.new
    end

    def show
      @user= User.find(params[:id])
      @book = Book.new
      @books = @user.books
    end

    def edit
      @users = User.new
      @user = User.find(params[:id])
      if @user != current_user
        redirect_to user_path(current_user)
      end
    end

    def create
      @user = User.new(user_params)
      @user.user_id = current_user.id
      @user.save
      redirect_to book_path(current_user.id)
    end

    def update
      @user = User.find(params[:id])
      if@user.update(user_params)
       redirect_to user_path(@user),notice:'You have updated user successfully.'
      else
      render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to  users_path
    end

    private

    def user_params
      params.require(:user).permit(:name,:profile_image,:introduction)
    end
end