require 'rails_helper'

RSpec.describe 'Input Opinion Workflow', type: :feature do  
  def fill_in_opinion
    fill_in 'Content', with: opinion
    choose 'Yes'
    click_on 'Create Opinion'
  end
  
  let(:opinion) { 'Ruby is better!' }
  let!(:topics) do
    [
      create(:topic, content: 'Is Ruby better than Python?'),
      create(:topic, content: 'Should abortion be legalized?')
    ]
  end

  it 'allows user to input his opinions' do
    visit '/'
    expect(page).to have_content topics.first.content

    fill_in_opinion
    expect(page).to have_content topics.second.content

    fill_in_opinion
    expect(page).to have_content 'Thank you for submitting your opinion.'
  end
end