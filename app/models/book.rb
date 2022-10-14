class Book < ApplicationRecord
  belongs_to :author

  def self.part_of_series
    self.where(part_of_series: true)
  end

  def self.max_word_count(number)
    self.select { |book| book.word_count > number }
  end
end