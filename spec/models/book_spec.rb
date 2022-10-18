require "rails_helper"

RSpec.describe Book do
  describe "relationships" do
    it {should belong_to :author}
  end

  describe "class methods" do 
    before(:each) do 
      @author = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "Brazil")
      @book_1 = @author.books.create!(part_of_series: true, word_count: 98000, title: "Darkness", genre: "Scifi/Fantasy")
      @book_2 = @author.books.create!(part_of_series: true, word_count: 56043, title: "Accelerando", genre: "Scifi")
      @book_3 = @author.books.create!(part_of_series: false, word_count: 105645, title: "My Go Story", genre: "Non-fiction")  
    end
    describe "#part_of_series" do 
      it "returns a collection of books which are part of a series" do   
        expect(Book.part_of_series).to eq([@book_1, @book_2])
      end
    end

    describe "#max_word_count" do 
      it "returns a collection of books which are above a given word count" do 
        expect(Book.max_word_count(100000)).to eq([@book_3])
      end
    end

    describe "order_by_title" do 
      it "returns the collection of books order alphabetically by title" do 
        expect(Book.order_by_title).to eq([@book_2, @book_1, @book_3])
      end
    end

    describe "exact_matched" do 
      it "returns a collection of books that has a field which matches the given keyword exactly" do 
        expect(Book.exact_matched("Scifi")).to eq([@book_2])
      end
    end
  end
end