class SessionsController < ApplicationController

    def new
        # we don't add nothing to the DB
    end

    def create
        @username = form_params[:username]
        @password = form_params[:password]

        # give back the user
        @user = User.find_by(username: @username).try(:authenticate, @password)

        if @user.present?
            session[:user_id] = @user.id

            flash[:success] = "You are now logged in !"

            redirect_to root_path
        else 
            render "new"
        end
        
    end


    def destroy
        reset_session
        flash[:user_id] = "You are now logged out"

        redirect_to root_path
    end

    def form_params
        params.require(:session).permit(:username, :password)
    end
end
