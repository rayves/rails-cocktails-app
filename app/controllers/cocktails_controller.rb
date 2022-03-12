require 'json'

class CocktailsController < ApplicationController

    before_action :load_cocktails

    def index
        render json: @cocktails
    end

    def show
        cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
        if cocktail
            render json: cocktail
        else
            render json: {error: "Could not find cocktail"}, status: 404
        end
    end

    private

    def load_cocktails
        # # if store in memory
        # @cocktails = [{}]
        @cocktails = JSON.parse(File.read(Rails.public_path.join('cocktails.json')))
    end

end
