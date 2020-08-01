class MainSpiritsController < ApplicationController

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
