require 'json'

class CocktailsController < ApplicationController

    before_action :load_cocktails
    before_action :set_cocktail, only: [:show, :update, :destroy, :edit]
        # before action only on specified actions instead of all of them
    # skip_before_action :verify_authenticity_token

    def index
        # render json: @cocktails
    end

    def new

    end

    def edit

    end

    def create
        new_cocktail = {id: @cocktails.last["id"] + 1, name: params[:name], base: params[:base], instructions: params[:instructions]}
        @cocktails.push(new_cocktail)
        save_cocktails(@cocktails)
        redirect_to cocktails_path
    end

    def show
        # cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
        # if cocktail
        #     render json: cocktail
        # else
        #     # render json: {error: "Could not find cocktail"}, status: 404
        #     render file: "public/404.html", status: :not_found, layout: false
        #         # file because it is not a template (not inside the views folder)

        #     # # ALternate syntax
        #     # render file: Rails.public_path.join("404.html"), status: :not_found, layout: false
        # end
        # render json: @cocktail
    end

    def update
        new_cocktail = {id: @cocktail["id"], name: params[:name], base: params[:base], instructions: params[:instructions]}
        @cocktails[@index] = new_cocktail
        save_cocktails(@cocktails)
        redirect_to cocktail_path(new_cocktail[:id])
    end

    def destroy
        @cocktails.delete_at(@index)
        save_cocktails(@cocktails)
        redirect_to cocktails_path
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

    def set_cocktail
            # saves cocktail where params id equals the id of the cocktail within the stored array of cocktails
        @cocktail = @cocktails.find {|cocktail| cocktail["id"] == params[:id].to_i}
            # takes the stored cocktail and using the id of that cocktails attempts to find the index value of that cocktail within the cocktails array
        unless @cocktail
            render file: "public/404.html", status: :not_found, layout: false
            return
        end
        @index = @cocktails.index {|cocktail| cocktail["id"] == @cocktail["id"]}
    end

end
