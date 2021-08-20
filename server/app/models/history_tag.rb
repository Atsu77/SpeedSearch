class HistoryTag < ActiveRecord::Base
  belongs_to :history
  belongs_to :tag

  validates :history_id, presence: true
  validates :tag_id, presence: true
end