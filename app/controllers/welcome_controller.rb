class WelcomeController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found
    def home

    end
    
end