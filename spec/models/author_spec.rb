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
  end
end