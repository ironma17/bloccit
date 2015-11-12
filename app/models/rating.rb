class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts
  belongs_to :rateable, polymorphic: true

  before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
      new_rating = Rating.find_or_create_by(severity: rating_string.to_i)
  end
end
