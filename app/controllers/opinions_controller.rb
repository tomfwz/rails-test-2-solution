class OpinionsController < ApplicationController
  include TopicsTracker
  before_action :redirect_if_topic_is_completed, only: :new

  def new
    @opinion = current_topic.opinions.new    
  end

  def create    
    @opinion = Opinion.new(opinion_params)

    if @opinion.save
      mark_topic_as_completed(topic_id)
      redirect_to_next_topic
    else
      render :new
    end
  end

  private

  def opinion_params
    params.require(:opinion)
          .permit(:content, :agree)
          .merge!(topic_id: topic_id)
  end

  def topic_id
    params[:topic_id]
  end

  def current_topic
    @current_topic ||= topic_id.present? ? Topic.find(topic_id) : Topic.first
  end

  def redirect_if_topic_is_completed
    redirect_to_next_topic if completed_topics.include? current_topic.id
  end

  def redirect_to_next_topic
    next_topic = Topic.next_incompleted_topic(completed_topics)    

    if next_topic
      redirect_to new_topic_opinion_url(topic_id: next_topic.id)
    else
      redirect_to thank_you_opinions_url
    end
  end
end