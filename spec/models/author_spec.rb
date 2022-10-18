require "rails_helper"

RSpec.describe Author do 
  describe "relationships" do 
    it {should have_many :books}
  end

  describe "class methods" do 
    describe "sort_by_creation" do 
      it "returns the collection of authors sorted by creation time" do 
        author_2 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        author_3 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
        author_1 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")

        expect(Author.sort_by_creation).to eq([author_2, author_3, author_1])
      end
    end

    describe "sort_by_book_amount" do 
      it "returns the collection of authors sorted by number of books" do 
        author_1 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
        author_2 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        author_3 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")

        author_3.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Fantasy")
        author_3.books.create!(part_of_series: true, word_count: 1234831, title: "Light", genre: "Scifi")
        author_1.books.create!(part_of_series: true, word_count: 124456, title: "Midday", genre: "Romance")

        expect(Author.sort_by_book_amount).to eq([author_3, author_1, author_2])
      end
    end

    describe "exact_matched" do 
      it "returns a collection of author's who have attributes matching the given keyword exactly" do 
        author_1 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
        author_2 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        author_3 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")

        expect(Author.exact_matched("USA")).to eq([author_1, author_2])
      end
    end
  end

  describe "instance methods" do 
    describe "#count_books" do 
      it "returns the number of books a particular author has" do 
        author_1 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")
        author_1.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Fantasy")
        author_1.books.create!(part_of_series: true, word_count: 1234831, title: "Light", genre: "Scifi")
        author_2 = Author.create!(active: false, dob_year: 1950, name: "Nam Nam", country: "USA")

        expect(author_1.count_books).to eq(2)
        expect(author_2.count_books).to eq(0)
      end
    end
  end
end