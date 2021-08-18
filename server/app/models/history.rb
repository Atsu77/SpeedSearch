class History < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { maximum: 100 }
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
end