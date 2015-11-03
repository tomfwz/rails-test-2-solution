module TopicsTracker
  extend ActiveSupport::Concerns

  def completed_topics
    session[:completed_topics] ||= []
  end

  def mark_topic_as_completed(topic_id)
    completed_topics << topic_id
  end
end