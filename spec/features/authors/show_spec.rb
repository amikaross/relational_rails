require 'rails_helper'

RSpec.describe 'the authors show page', type: :feature do 
  before(:each) do 
    @author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
  end
  describe "As a visitor" do 
    describe "When I visit '/parents/:id'" do 
      it "displays one name of the author who's ID is visited" do 
        visit "/authors/#{@author.id}"

        expect(page).to have_content(@author.name)
        expect(page).to_not have_content(@author_2.name)
      end

      it "displays all the information in the author table columns" do 
        visit "/authors/#{@author.id}"
    
        expect(page).to have_content(@author.active)
        expect(page).to have_content(@author.dob_year)
        expect(page).to have_content(@author.country)
        expect(page).to have_content(@author.created_at)
        expect(page).to have_content(@author.updated_at)
      end
    
      it "displays the number of books associated with the author" do 
        @author.books.create!(part_of_series: false, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
        visit "/authors/#{@author.id}"
        
        expect(page).to have_content("No. books: 1")
      end

      it "displays a link to the Author index" do 
        visit "/authors/#{@author.id}"
        expect(page).to have_link("Author List", href: "/authors")
      end

      it "displays a link to the Book index" do 
        visit "/authors/#{@author.id}"
        expect(page).to have_link("Book List", href: "/books")
      end

      it "displays a link to return home" do 
        visit "/authors/#{@author.id}"
        expect(page).to have_link("Return Home", href: "/")
      end

      it "displays a link to the Author's books page" do 
        visit "/authors/#{@author.id}"
        expect(page).to have_link("Author's Books", href: "/authors/#{@author.id}/books")
      end
    end
  end
end