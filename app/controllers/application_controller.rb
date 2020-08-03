class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception   
    include ApplicationHelper

    def check_user
        if !logged_in?
            redirect_to root_path
        end
    end

    def handle_record_not_found
        render partial: 'shared/_not_found'
    end

    def not_found
        redirect_to root_path, alert: "Sorry, that page was not found."
    end


end
