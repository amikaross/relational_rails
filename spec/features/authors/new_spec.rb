require "rails_helper"

RSpec.describe "create a new author", type: :feature do 
  describe "As a visitor" do 
    describe "When I visit '/authors/new'" do 
      it "displays a form for a new author record" do 
        visit "/authors/new"
        expect(page).to have_button("Create Author")
        expect(page).to have_field("name")
        expect(page).to have_field("dob_year")
        expect(page).to have_field("country")
        expect(page).to have_select("active")
      end

      it "after filling in form, clicking 'Create Author' redirects me to the updated Author index" do 
        visit "/authors/new"
        fill_in "name", with: "Ursula K. Le Guin"
        fill_in "dob_year", with: "1929"
        fill_in "country", with: "United States"
        select "False", from: "active"
        click_on "Create Author"
        expect(current_path).to eq("/authors")
        expect(page).to have_content("Ursula K. Le Guin")
      end
    end
  end
end 