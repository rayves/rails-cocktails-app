# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

spirits = ["vodka", "gin", "rum", "whiskey", "burbon", "brandy", "moonshine"]

if BaseSpirit.count == 0
    spirits.each do |spirit|
        BaseSpirit.create(name: spirit)
        puts "created #{spirit}"
    end
end

if Cocktail.count == 0
    Cocktail.create(name: "Espresso Martini", base_spirit_id: 1, instructions: "Place the vodka, kahlua and espresso in a cocktail shaker with ice. Shake vigorously 10 times, then pour briskly into a cocktail glass. (Scrape out foam inside if necessary. Garnish with 3 coffee beans and serve immediately.")
    puts "Created Espresso Martini"
    Cocktail.create(name: "Negroni", base_spirit_id: 2, instructions: "Step 1 - * 1Pour the gin, vermouth and Campari into a mixing glass or jug with ice. Stir well until the outside of the glass feels cold. Step 2 - * Strain into a tumbler and add 1 large ice sphere or some fresh ice, and garnish with an orange slice, using a blood orange when in season.")
    puts "Created Negroni"
    Cocktail.create(name: "Gin and Tonic", base_spirit_id: 2, instructions: "Fill a high ball glass with ice. Add gin and lime juice. Then top with tonic water. Garnish with lime wedge or slice.")
    puts "Created Gin and Tonic"
end