class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception   
    include ApplicationHelper

    def check_user
        if !logged_in?
            redirect_to root_path
        end
    end


end
