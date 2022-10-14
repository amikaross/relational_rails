require "rails_helper"

RSpec.describe "Author deletion" do 
  describe "As a visitor" do 
    describe "When I visit the Author's show page" do 
      it "has a button to delete the Author" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
      
        visit "/authors/#{author.id}"
        click_button("Delete")

        expect(current_path).to eq("/authors")
        expect(page).to_not have_content("Nam Nam")
      end

      it "delete's all of the author's books" do
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        book = author.books.create!(part_of_series: true, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
        visit "/books"

        expect(page).to have_content("Left Hand of Darkness")

        visit "/authors/#{author.id}"
        click_button("Delete")
        visit "/books"

        expect(page).to_not have_content("Left Hand of Darkness")
      end
    end
  end
end