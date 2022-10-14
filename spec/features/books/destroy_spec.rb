require "rails_helper"

RSpec.describe "Book deletion" do 
  describe "As a visitor" do 
    describe "When I visit the book's show page" do 
      it "has a button to delete the Book" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: true, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
        visit "/books/#{book.id}"
        click_button("Delete")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("Left Hand of Darkness")
      end
    end

    describe "When I visit the books index page" do 
      it "has a button to delete book for all books listed" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book_1 = author.books.create!(part_of_series: true, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
        book_2 = author.books.create!(part_of_series: true, word_count: 134982, title: "The City", genre: "Scifi")
        book_3 = author.books.create!(part_of_series: true, word_count: 78945, title: "Right Hand of Light", genre: "Fantasy")
        visit "/books"
        expect(page).to have_button("Delete 'Left Hand of Darkness'")
        expect(page).to have_button("Delete 'The City'")
        expect(page).to have_button("Delete 'Right Hand of Light'")
        click_button("Delete 'Left Hand of Darkness'")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("Left Hand of Darkness")
      end
    end

    describe "When I visit the Author's books index" do 
      it "has a button to delete each book for all books listed" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book_1 = author.books.create!(part_of_series: true, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
        book_2 = author.books.create!(part_of_series: true, word_count: 134982, title: "The City", genre: "Scifi")
        book_3 = author.books.create!(part_of_series: true, word_count: 78945, title: "Right Hand of Light", genre: "Fantasy")
        visit "/authors/#{author.id}/books"

        expect(page).to have_button("Delete 'Left Hand of Darkness'")
        expect(page).to have_button("Delete 'The City'")
        expect(page).to have_button("Delete 'Right Hand of Light'")
        
        click_button("Delete 'Left Hand of Darkness'")

        expect(current_path).to eq("/books")
        expect(page).to_not have_content("Left Hand of Darkness")
      end
    end
  end
end