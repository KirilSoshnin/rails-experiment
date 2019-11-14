class Portfolio < ApplicationRecord
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scope method 1
  def self.angular
    where(subtitle: 'Angular')
  end

  # Custom scope method 2
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }

  after_initialize :set_defaults

  def set_defaults
    self.main_image ||= 'http://placehold.it/600/400'
    self.thumb_image ||= 'http://placehold.it/300/150'
  end
end
