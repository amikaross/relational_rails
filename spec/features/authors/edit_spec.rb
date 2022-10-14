require "rails_helper"

RSpec.describe "the edit author page" do 
  describe "As a visitor" do 
    describe "When I visit the Author show page" do 
      it "displays a button to Update Author, which takes me to an edit page" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        visit "/authors/#{author.id}"
        click_button("Update Author")

        expect(current_path).to eq("/authors/#{author.id}/edit")
      end

      it "can edit the author" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        visit "/authors/#{author.id}"

        expect(page).to_not have_content("Nami Nami")

        click_button "Update Author"
        fill_in "name", with: "Nami Nami"
        click_button "Update"

        expect(current_path).to eq("/authors")
        expect(page).to have_content("Nami Nami")
      end
    end

    describe "when I visit the Authors Index page" do 
      it "has an Update Author button for every author" do 
        author_1 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
        author_3 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
        visit "/authors"

        expect(page).to have_button("Update Nam Nam")
        expect(page).to have_button("Update Iain Banks")
        expect(page).to have_button("Update Lee Saville")

        click_button("Update Nam Nam")
        expect(current_path).to eq("/authors/#{author_1.id}/edit")
      end
    end
  end
end