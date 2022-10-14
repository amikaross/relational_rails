require "rails_helper"

RSpec.describe "edit books" do 
  describe "As a visitor" do 
    describe "When I visit the Books show page" do 
      it "displays a button to Update Book, which takes me to an edit page" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        visit "/books/#{book.id}"
        click_button("Update Book")

        expect(current_path).to eq("/books/#{book.id}/edit")
      end

      it "can edit the book" do
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        visit "/books/#{book.id}"

        expect(page).to_not have_content("Heart of")

        click_button("Update Book")
        fill_in "title", with: "Heart of Darkness"
        click_button "Update"

        expect(current_path).to eq("/books")
        expect(page).to have_content("Heart of Darkness")
      end
    end 

    describe "when I visit the Books Index page" do 
      it "has an Update Book button for every book" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book_1 = author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        book_2 = author.books.create!(part_of_series: true, word_count: 23423, title: "Testing a very long name just in case it looks terrible", genre: "Scifi/Fantasy")
        book_3 = author.books.create!(part_of_series: true, word_count: 3580023, title: "Light", genre: "Scifi/Fantasy")
        visit "/books"

        expect(page).to have_button("Update 'Darkness'")
        expect(page).to have_button("Update 'Testing a very long name just in case it looks terrible'")
        expect(page).to have_button("Update 'Light'")

        click_button("Update 'Darkness'")

        expect(current_path).to eq("/books/#{book_1.id}/edit")
      end
    end

    describe "when I visit the Author's books index page" do 
      it "has an Update Book button for every book" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book_1 = author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        book_2 = author.books.create!(part_of_series: true, word_count: 23423, title: "Testing a very long name just in case it looks terrible", genre: "Scifi/Fantasy")
        book_3 = author.books.create!(part_of_series: true, word_count: 3580023, title: "Light", genre: "Scifi/Fantasy")
        visit "/authors/#{author.id}/books"

        expect(page).to have_button("Update 'Darkness'")
        expect(page).to have_button("Update 'Testing a very long name just in case it looks terrible'")
        expect(page).to have_button("Update 'Light'")

        click_button("Update 'Darkness'")

        expect(current_path).to eq("/books/#{book_1.id}/edit")
      end
    end
  end
end