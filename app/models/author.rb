class Author < ApplicationRecord
  has_many :books

  def self.sort_by_creation
    order(:created_at)
  end

  def self.sort_by_book_amount
    left_joins(:books).group(:id).order('COUNT(books.id) DESC')
  end

  def self.exact_matched(string)
    where(["name = ? OR country = ? OR dob_year = ?", string, string, string.to_i])
  end

  def self.partial_matched(string)
    s = "%#{string}%"
    where("name ILIKE ? OR country ILIKE ?", s, s)
  end

  def count_books
    books.count 
  end
end