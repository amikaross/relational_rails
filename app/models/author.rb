class Author < ApplicationRecord
  has_many :books

  def self.sort_by_creation
    self.order(:created_at)
  end

  def self.sort_by_book_amount
    self.left_joins(:books).group(:id).order('COUNT(books.id) DESC')
  end

  def count_books
    books.count 
  end
end