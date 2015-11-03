class Topic < ActiveRecord::Base
  has_many :opinions
  validates :content, presence: true

  def self.next_incompleted_topic(completed_topics)
    Topic.where.not(id: completed_topics).first
  end
end