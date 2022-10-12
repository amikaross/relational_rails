require 'rails_helper'

RSpec.describe 'the books showpage' do 
  before(:each) do 
    @author_1 = Author.create!(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
  
    @book_1 = @author_1.books.create!(part_of_series: false, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
    @book_2 = @author_2.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
  end

  describe "As a visitor" do 
    describe "When I visit '/authors/:author_id/books'" do 
      it "displays one title of the book who's ID is visited" do 
        visit "/books/#{@book_1.id}"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to_not have_content(@book_2.title)
      end
    
      it "displays all of the book's attributes" do 
        visit "/books/#{@book_1.id}"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.author.name)
        expect(page).to have_content(@book_1.part_of_series)
        expect(page).to have_content(@book_1.word_count)
        expect(page).to have_content(@book_1.genre)
        expect(page).to have_content(@book_1.created_at)
        expect(page).to have_content(@book_1.updated_at)
      end

      it "displays a link to the Author index" do 
        visit "/books/#{@book_1.id}"
        expect(page).to have_link("Author List", href: "/authors")
      end

      it "displays a link to the Book index" do 
        visit "/books/#{@book_1.id}"
        expect(page).to have_link("Book List", href: "/books")
      end

      it "displays a link to return home" do 
        visit "/books/#{@book_1.id}"
        expect(page).to have_link("Return Home", href: "/")
      end
    end
  end
end