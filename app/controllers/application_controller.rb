class ApplicationController < ActionController::Base

    # make current_user available for views and controller
    helper_method :current_user
    helper_method :is_logged_in?

    # run this before every single page
    before_action :current_user

    def current_user
        # if user session[:user_id] present means login
        if is_logged_in?
            @current_user = User.find(session[:user_id])
        else
            @current_user = nil
        end
        @current_user
    end

    def is_logged_in?
        session[:user_id].present?
    end
end
