class MainSpiritsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def index
        @spirits = MainSpirit.all
    end

    def show
        set_spirit
    end

    private

    def set_spirit
        @spirit = MainSpirit.find_by_id(params[:id])
    end

end
