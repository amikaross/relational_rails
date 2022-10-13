require "rails_helper"

RSpec.describe "edit books" do 
  describe "As a visitor" do 
    describe "When I visit the Books show page" do 
      it "displays a button to Update Book, which takes me to an edit page" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: false, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        visit "/books/#{book.id}"
        click_button("Update Book")

        expect(current_path).to eq("/books/#{book.id}/edit")
      end

      it "can edit the book" do
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: false, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        visit "/books/#{book.id}"

        expect(page).to_not have_content("Heart of")
        click_button("Update Book")

        fill_in "title", with: "Heart of Darkness"
        click_button "Update"

        expect(current_path).to eq("/books")
        expect(page).to have_content("Heart of Darkness")
      end
    end 
  end
end