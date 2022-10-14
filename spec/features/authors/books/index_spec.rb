require 'rails_helper'

RSpec.describe 'the authors books index page' do 
  before(:each) do 
    @author_1 = Author.create!(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
    @book_1 = @author_1.books.create!(part_of_series: false, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
    @book_2 = @author_2.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
    @book_3 = @author_1.books.create!(part_of_series: false, word_count: 105645, title: "My Go Story", genre: "Non-fiction")
    @book_4 = @author_1.books.create!(part_of_series: false, word_count: 105645, title: "Alphabets", genre: "Non-fiction")

  end

  describe "As a visitor" do 
    describe "When I visit '/authors/:author_id/books'" do 
      it "displays a list of all titles for books written by that author" do 
        visit "/authors/#{@author_1.id}/books"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_3.title)
        expect(page).to_not have_content(@book_2.title)
      end
    
      it "displays the associated attributes with each book" do 
        visit "/authors/#{@author_1.id}/books"
    
        expect(page).to have_content(@book_1.title)
        expect(page).to have_content(@book_1.author.name)
        expect(page).to have_content(@book_1.part_of_series)
        expect(page).to have_content(@book_1.word_count)
        expect(page).to have_content(@book_1.genre)
        expect(page).to have_content(@book_1.created_at)
        expect(page).to have_content(@book_1.updated_at)
        expect(page).to have_content(@book_3.title)
        expect(page).to have_content(@book_3.author.name)
        expect(page).to have_content(@book_3.part_of_series)
        expect(page).to have_content(@book_3.word_count)
        expect(page).to have_content(@book_3.genre)
        expect(page).to have_content(@book_3.created_at)
        expect(page).to have_content(@book_3.updated_at)
      end

      it "displays a link to the Author index" do 
        visit "/authors/#{@author_1.id}/books"
        expect(page).to have_link("Author List", href: "/authors")
      end

      it "displays a link to the Book index" do 
        visit "/authors/#{@author_1.id}/books"
        expect(page).to have_link("Book List", href: "/books")
      end

      it "displays a link to return home" do 
        visit "/authors/#{@author_1.id}/books"
        expect(page).to have_link("Return Home", href: "/")
      end

      it "displays a 'Sort Alphabetically' button which reloads the index, sorted" do 
        visit "/authors/#{@author_1.id}/books"

        expect(page).to have_button("Sort Alphabetically")
        expect(@book_1.title).to appear_before(@book_4.title)

        click_on("Sort Alphabetically")
        
        expect(@book_4.title).to appear_before(@book_1.title)
      end

      it "has a form that allows me to limit the number of displayed books by word_count" do 
        visit "/authors/#{@author_1.id}/books"

        expect(page).to have_content("Only return records with more than")
        expect(page).to have_field("max_word_count")
        expect(page).to have_content("words")
        expect(page).to have_content("#{@book_1.title}")

        fill_in("max_word_count", with: "100,000")
        click_button("Submit")

        expect(current_path).to eq("/authors/#{@author_1.id}/books")
        expect(page).to_not have_content("#{@book_1.title}")
        expect(page).to have_content("#{@book_3.title}")
        expect(page).to have_content("#{@book_4.title}")
      end
    end
  end
end