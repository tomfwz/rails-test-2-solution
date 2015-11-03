class Opinion < ActiveRecord::Base
  belongs_to :topic
  validates :content, :agree, :topic, presence: true  
end