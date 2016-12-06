require 'rails_helper'

feature 'comments' do
  before do
    sign_up
    create_post
  end

  context 'creating comments' do
    it 'users can leave a comment' do
      click_link 'Comments'
      fill_in "Comments", with: 'Testing'
      click_button 'Leave Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content('Testing')
    end
  end
end
