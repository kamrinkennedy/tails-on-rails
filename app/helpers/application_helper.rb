module ApplicationHelper

    def logged_in?
        !!current_user
    end 

    def current_user
        User.find_by_id(session[:user_id])
    end

    def check_user
        if !logged_in?
            redirect_to root_path
        end
    end

end
