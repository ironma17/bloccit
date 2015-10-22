class Rating < ActiveRecord::Base
  has_many :topics
  has_many :posts
  belongs_to :rateable, polymorphic: true

  before_save { self.severity ||= :PG }

  enum severity: [ :PG, :PG13, :R ]

  def self.update_rating(rating_string)
    new_rating = []
    unless rating_string.nil? || rating_string.empty?
      rating_severity = rating_string.split(",").first.strip
      new_rating = Rating.find_or_create_by(severity: rating_severity)
    end
    new_rating
  end
end
