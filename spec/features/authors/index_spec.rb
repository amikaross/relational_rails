require 'rails_helper'

RSpec.describe 'the authors index page', type: :feature do 
  before(:each) do 
    @author = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
    @author_3 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
    @author_3.books.create!(part_of_series: false, word_count: 98000, title: "Left Hand of Darkness", genre: "Scifi/Fantasy")
    @author_3.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
    @author_2.books.create!(part_of_series: false, word_count: 105645, title: "My Go Story", genre: "Non-fiction")
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

      it "displays a button to sort the Authors by the number of books" do 
        visit "/authors"

        expect(page).to have_button("Sort By No. of Books")
        expect("Nam Nam").to appear_before("Iain Banks")
        expect("Iain Banks").to appear_before("Lee Saville")

        click_button("Sort By No. of Books")
        
        expect("Lee Saville").to appear_before("Iain Banks")
        expect("Iain Banks").to appear_before("Nam Nam")
      end

      it "shows the number of books by each author" do 
        visit "/authors"

        expect(page).to have_content("No. books: 0")
        expect(page).to have_content("No. books: 2")
        expect(page).to have_content("No. books: 1")
      end

      it "displays a text-field and Search button which limits the displayed results to exact matches of the keyword" do 
        author_4 = Author.create!(active: false, dob_year: 1821, name: "Leo Tolstoy", country: "Russia/USA")
        visit "/authors"
        
        expect(page).to have_field("exact_keyword")
        expect(page).to have_content(@author_2.name)
        expect(page).to have_content(@author_3.name)
        expect(page).to have_content(author_4.name)


        fill_in "exact_keyword", with: "USA"
        click_button("Search")

        expect(current_path).to eq("/authors")
        expect(page).to have_content(@author.name)
        expect(page).to have_content(@author_3.name)
        expect(page).to_not have_content(@author_2.name)
        expect(page).to_not have_content(author_4.name)
      end

      it "displays a text-field and Search button which limits the displayed results to partial matches of the keyword" do 
        author_4 = Author.create!(active: false, dob_year: 1821, name: "Leo Tolstoy", country: "Russia/USA")
        visit "/authors"
        
        expect(page).to have_field("partial_keyword")
        expect(page).to have_content(@author_2.name)
        expect(page).to have_content(@author_3.name)
        expect(page).to have_content(author_4.name)


        fill_in "partial_keyword", with: "USA"
        click_button("Partial Match Search")

        expect(current_path).to eq("/authors")
        expect(page).to have_content(@author.name)
        expect(page).to have_content(@author_3.name)
        expect(page).to_not have_content(@author_2.name)
        expect(page).to have_content(author_4.name)
      end
    end
  end
end