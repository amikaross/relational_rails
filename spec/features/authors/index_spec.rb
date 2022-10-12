require 'rails_helper'

RSpec.describe 'the authors index page' do 
  before(:each) do 
    @author = Author.create!(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
    @author_2 = Author.create!(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
    @author_3 = Author.create!(active: false, dob_year: 1989, name: "Lee Saville", country: "USA")
  end

  it "displays a list of all author names" do 
    visit "/authors"

    expect(page).to have_content(@author.name)
    expect(page).to have_content(@author_2.name)
    expect(page).to have_content(@author_3.name)
  end
end