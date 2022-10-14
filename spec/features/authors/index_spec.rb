require 'rails_helper'

RSpec.describe 'the authors index page', type: :feature do 
  before(:each) do 
    @author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
    @author_3 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
  end

  describe "as a visitor" do
    describe "when I visit '/authors'" do 
      it "displays a list of all author names" do 
        visit "/authors"

        expect(page).to have_content(@author.name)
        expect(page).to have_content(@author_2.name)
        expect(page).to have_content(@author_3.name)
      end

      it "displays when the record was created" do 
        visit "/authors"
        
        expect(page).to have_content(@author.created_at)
        expect(page).to have_content(@author_2.created_at)
        expect(page).to have_content(@author_3.created_at)
      end

      it "orders the records by when they were created" do 
        visit "/authors"
        
        expect(@author.name).to appear_before(@author_2.name)
        expect(@author_2.name).to appear_before(@author_3.name)
      end

      it "displays a link to the Author index" do 
        visit "/authors"
        expect(page).to have_link("Author List", href: "/authors")
      end

      it "displays a link to the Book index" do 
        visit "/authors"
        expect(page).to have_link("Book List", href: "/books")
      end

      it "displays a link to return home" do 
        visit "/authors"
        expect(page).to have_link("Home", href: "/")
      end

      it "displays a button create a 'New Author' page" do 
        visit "/authors"
        expect(page).to have_button("New Author")
        click_button("New Author")
        expect(current_path).to eq("/authors/new")
      end
    end
  end
end