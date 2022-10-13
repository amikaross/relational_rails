require "rails_helper"

RSpec.describe Book do 
  it {should belong_to :author}
end