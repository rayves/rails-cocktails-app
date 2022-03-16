module CocktailsHelper
    def generate_button_text(cocktail)
        if cocktail.id
            return "Edit #{cocktail.name}"
        else
            return "Create"
        end
    end

    def select_border_color(id)
        colour = "%06x" % (rand * 0xffffff)
        case id
        when 1
            return "border-top: 10px solid #935678"
        when 2
            return "border-top: 10px solid #abc472"
        when 3
            return "border-top: 10px solid #9D702E"
        when 4
            return "border-top: 10px solid #d29062"
        when 5
            return "border-top: 10px solid #ffb600"
        when 6
            return "border-top: 10px solid #b7621b"
        when 7
            return "border-top: 10px solid #d7d9d0"
        else
            return "border-top: 10px solid ##{colour}"
        end
    end
end