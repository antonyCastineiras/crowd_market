require 'rails_helper'

feature 'likes' do
  before do
    sign_up(first_name="Testy",last_name="Tester",username="Test",email="test@test.com",password="password")
    create_post
  end

  context 'like posts' do
    scenario 'user can not like posts unless signed in' do
      sign_out
      visit '/'
      expect(page).to_not have_link('Like')
    end
    scenario 'lets a user like a post' do
      like_post
      expect(page).to have_content('Likes: 1')
    end
    scenario 'lets a user unlike a post' do
      like_post
      click_link 'Like'
      expect(page).to have_content('Likes: 0')
    end
  end

end
