class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Signed in"
            redirect_to root_path
        else
            render "new"
        end
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:success] = "Updated!"
            redirect_to user_path(@user)
        else
            render "edit"
        end
    end
    def new
        @user = User.new
    end
    private
    def user_params
        params.require(:user).permit(:username, :email,:password)
    end
end