# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

author_1 = Author.create(name: "Ursula K Le Guin", dob_year: 1929, country: "United States", active: false)
author_2 = Author.create(name: "Iain M Banks", dob_year: 1954, country: "Scotland, UK", active: false)
author_3 = Author.create(name: "N.K. Jemisin", dob_year: 1972, country: "United States", active: true)

author_1.books.create([{title: "A Wizard of Earthsea", genre: "fantasy", word_count: 56533, part_of_series: true}, 
                       {title: "The Left Hand of Darkness", genre: "scifi", word_count: 89745, part_of_series: true},
                       {title: "The Disposessed", genre: "scifi", word_count: 115713, part_of_series: true}])

author_2.books.create([{title: "Consider Phlebas", genre: "fantasy", word_count: 174567, part_of_series: true}, 
                       {title: "The Algebraist", genre: "scifi", word_count: 152359, part_of_series: false},
                       {title: "Matter", genre: "scifi", word_count: 183775, part_of_series: true}])

author_3.books.create([{title: "The Fifth Season", genre: "fantasy", word_count: 128000, part_of_series: true}, 
                       {title: "How Long 'til Black Future Month", genre: "non-fiction", word_count: 126359, part_of_series: false},
                       {title: "The Stone Sky", genre: "scifi", word_count: 124384, part_of_series: true}])


