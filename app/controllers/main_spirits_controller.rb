class MainSpiritsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def index
        @spirits = MainSpirit.all
    end

    def show
        if !set_spirit
            redirect_to root_path, alert: "That page was not found."
        end
    end

    private

    def set_spirit
        @spirit = MainSpirit.find_by_id(params[:id])
    end

end
