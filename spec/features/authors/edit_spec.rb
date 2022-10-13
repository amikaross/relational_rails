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
  end
end