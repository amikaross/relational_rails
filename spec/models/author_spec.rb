require "rails_helper"

RSpec.describe Author do 
  it {should have_many :books}
end