require 'json'

class CocktailsController < ApplicationController

    before_action :load_cocktails
    skip_before_action :verify_authenticity_token

    def index
        render json: @cocktails
    end

    def create
        new_cocktail = {id: @cocktails.last["id"] + 1, name: params[:name], base: params[:base], instructions: params[:instructions]}
        @cocktails.push(new_cocktail)
        save_cocktails(@cocktails)
        render json: new_cocktail, status: 201
    end

    def show
        cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
        if cocktail
            render json: cocktail
        else
            # render json: {error: "Could not find cocktail"}, status: 404
            render file: "public/404.html", status: :not_found, layout: false
                # file because it is not a template (not inside the views folder)

            # # ALternate syntax
            # render file: Rails.public_path.join("404.html"), status: :not_found, layout: false

        end
    end

    private

    def load_cocktails
        # # if store in memory
        # @cocktails = [{}]
        @cocktails = JSON.parse(File.read(Rails.public_path.join('cocktails.json')))
    end

    def save_cocktails(cocktails)
        File.write((Rails.public_path.join('cocktails.json')), JSON.pretty_generate(cocktails))
    end

end
