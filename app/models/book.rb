class Book < ApplicationRecord
  belongs_to :author

  def self.part_of_series
    where(part_of_series: true)
  end

  def self.max_word_count(number)
    where("word_count > #{number}")
  end

  def self.order_by_title
    order(:title)
  end
end