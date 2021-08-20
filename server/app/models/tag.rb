class Tag < ActiveRecord::Base
  has_many :history_tags, dependent: :destroy
  has_many :histories, through: :history_tags, source: :history

  validates :tag_name, length: { maximum: 100 }
end