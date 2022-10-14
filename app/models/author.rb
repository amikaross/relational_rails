class Author < ApplicationRecord
  has_many :books

  def self.sort_by_creation
    self.order(:created_at)
  end
end