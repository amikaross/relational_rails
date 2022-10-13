require "rails_helper"

RSpec.describe "the edit author page" do 
  describe "As a visitor" do 
    describe "When I visit the parent show page" do 
      it "displays a button to Update Author, which when clicked takes me to an edit page" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        visit "/authors"

        expect(page).to have_button("Update Author")

        click_on("Update Author")

        expect(current_path).to eq("/authors/#{author.id}/edit")
      end

      it "can edit the author" do 
        author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        visit "/authors"

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