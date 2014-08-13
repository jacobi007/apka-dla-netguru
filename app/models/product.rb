class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :title, :price, :description
  validates_numericality_of :price
  validates_format_of :price, with: /\A\d+\.?\d{0,2}\z/

  def average_rating
    average = 0
    reviews = self.reviews

    reviews.each do |rev|
      average += rev.rating
    end
    average /= reviews.count.to_f
  end
end
