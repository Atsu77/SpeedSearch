class History < ActiveRecord::Base
  belongs_to :user
  has_many :history_tags, dependent: :destroy
  has_many :tags, through: :history_tags, source: :tag

  validates :title, length: { maximum: 100 }
  validates :url, format: /\A#{URI::DEFAULT_PARSER.make_regexp(%w[http https])}\z/


  def save_tag(sent_tag)
    sent_tag.each do |new_tag|
      current_tag = Tag.find_or_create_by(tag_name: new_tag)
      self.tags << current_tag
    end
  end
end
