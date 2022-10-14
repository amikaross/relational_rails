class Book < ApplicationRecord
  belongs_to :author

  def self.part_of_series
    self.where(part_of_series: true)
  end
end