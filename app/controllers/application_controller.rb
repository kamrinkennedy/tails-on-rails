class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def logged_in?
        !!current_user
    end 

    def current_user
        User.find_by_id(session[:user_id])
    end

    def check_user
        if !logged_in? || current_user.id != @user.id
            redirect_to root_path
        end
    end


end
