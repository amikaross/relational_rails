require 'rails_helper'

RSpec.describe 'the authors show page' do 
  before(:each) do 
    @author = Author.create(active: false, dob_year: 1950, name: "Ursula K Leguin", country: "USA")
    @author_2 = Author.create(active: true, dob_year: 1945, name: "Iain Banks", country: "UK")
  end
  it "displays one name of the author who's ID is visited" do 
    visit "/authors/#{@author.id}"

    expect(page).to have_content(@author.name)
    expect(page).to_not have_content(@author_2.name)
  end
  it "displays all the information in the author table columns" do 
    visit "/authors/#{@author.id}"

    expect(page).to have_content(@author.active)
    expect(page).to have_content(@author.dob_year)
    expect(page).to have_content(@author.country)
    expect(page).to have_content(@author.created_at)
    expect(page).to have_content(@author.updated_at)
  end
end