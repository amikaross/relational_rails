require "rails_helper"

RSpec.describe "Create a new Author's book", type: :feature do 
  describe "As a visitor" do 
    describe "When I visit '/authors/:id/books'" do 
      it "has a link to a form to create a new book record by that author" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
        visit "/authors/#{author.id}/books"
        click_link("Create Book")

        expect(current_path).to eq("/authors/#{author.id}/books/new")
        expect(page).to have_button("Create Book")
        expect(page).to have_field("title")
        expect(page).to have_field("genre")
        expect(page).to have_field("word_count")
        expect(page).to have_select("part_of_series")
      end

      it "after filling in form, clicking 'Create Book' redirects me to the updated Author's Books index" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
        visit "/authors/#{author.id}/books"

        expect(page).to_not have_content("The Left Hand of Darkness")

        click_link("Create Book")
        fill_in "title", with: "The Left Hand of Darkness"
        fill_in "genre", with: "Scifi"
        fill_in "word_count", with: "89745"
        select "False", from: "part_of_series"
        click_on "Create Book"

        expect(current_path).to eq("/authors/#{author.id}/books")
        expect(page).to have_content("The Left Hand of Darkness")
      end
    end
  end
end 