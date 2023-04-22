class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(form_params)
        # if user pass all the requirement and is save
        if @user.save
            # keep hold of that user
            session[:user_id] = @user.id
            flash[:success] = "Thanks for sign up"
            redirect_to root_path
        else
            render "new"
        end
    end



    def form_params
        params.require(:user).permit(:name, :username, :email, 
            :password, :password_confirmation)
    end



end
