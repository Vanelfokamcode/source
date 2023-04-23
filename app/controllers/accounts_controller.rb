class AccountsController < ApplicationController
    def edit
        # from the application_controller.rb
        @user = @current_user
    end

    def update
        @user = @current_user

        if @user.update(form_params)
            flash[:success] = "Your account has been updated"
            redirect_to root_path
        else 
            render "edit"
        end
    end

    def destroy
        # delete user
        @current_user.destroy

        # remove session
        reset_session

        redirect_to root_path

    end

    def form_params
        params.require(:user).permit(:name, :username)
    end
end
