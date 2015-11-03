class Opinion < ActiveRecord::Base
  belongs_to :topic
  validates :content, :topic, presence: true
  validates_inclusion_of :agree, in: [true, false]
end