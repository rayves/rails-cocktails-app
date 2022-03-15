module CocktailsHelper
    def generate_button_text(cocktail)
        if cocktail.id
            return "Edit #{cocktail.name}"
        else
            return "Create"
        end
    end
end
