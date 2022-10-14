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
  end
end