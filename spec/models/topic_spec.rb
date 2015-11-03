require 'rails_helper'

RSpec.describe Topic, type: :model do
  context 'Validation' do
    it { is_expected.to validate_presence_of :content }
  end

  context 'Association' do
    it { is_expected.to have_many :opinions }
  end

  describe '#next_incompleted_topic' do
    let!(:topics) { create_list(:topic, 3) }
    let(:completed_topics) { [topics.first] }

    it 'returns the next incompleted topic' do    
      next_topic = Topic.next_incompleted_topic(completed_topics)
      expect(next_topic).to eq topics.second
    end
  end
end