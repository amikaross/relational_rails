require "rails_helper"

RSpec.describe Book do
  describe "relationships" do
    it {should belong_to :author}
  end

  describe "class methods" do 
    describe "#part_of_series" do 
      it "returns a collection of books which are part of a series" do 
        author = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "Brazil")
        book_1 = author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
        book_2 = author.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
        book_3 = author.books.create!(part_of_series: false, word_count: 105645, title: "My Go Story", genre: "Non-fiction")  
        expect(Book.part_of_series).to eq([book_1, book_2])
      end
    end
  end
end