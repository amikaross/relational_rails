require 'rails_helper'

RSpec.describe 'the books index page' do 
  before(:each) do 
    @author_1 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
    @author_3 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "Brazil")
    @book_1 = @author_1.books.create!(part_of_series: false, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
    @book_2 = @author_2.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
    @book_3 = @author_3.books.create!(part_of_series: false, word_count: 105645, title: "My Go Story", genre: "Non-fiction")
  end

  describe "As a visitor" do 
    describe "When I visit '/books'" do 
      it "displays a list of all book titles" do 
        visit "/books"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_3.title)
      end
    
      it "displays all of the book attributes" do 
        visit "/books"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.author.name)
        expect(page).to have_content(@book_1.part_of_series)
        expect(page).to have_content(@book_1.word_count)
        expect(page).to have_content(@book_1.genre)
        expect(page).to have_content(@book_1.created_at)
        expect(page).to have_content(@book_1.updated_at)
        expect(page).to have_content(@book_2.title)
        expect(page).to have_content(@book_2.author.name)
        expect(page).to have_content(@book_2.part_of_series)
        expect(page).to have_content(@book_2.word_count)
        expect(page).to have_content(@book_2.genre)
        expect(page).to have_content(@book_2.created_at)
        expect(page).to have_content(@book_2.updated_at)
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.author.name)
        expect(page).to have_content(@book_3.part_of_series)
        expect(page).to have_content(@book_3.word_count)
        expect(page).to have_content(@book_3.genre)
        expect(page).to have_content(@book_3.created_at)
        expect(page).to have_content(@book_3.updated_at)
      end

      it "displays a link to the Author index" do 
        visit "/books"
        expect(page).to have_link("Author List", href: "/authors")
      end

      it "displays a link to the Book index" do 
        visit "/books"
        expect(page).to have_link("Book List", href: "/books")
      end

      it "displays a link to return home" do 
        visit "/books"
        expect(page).to have_link("Return Home", href: "/")
      end
    end
  end
end