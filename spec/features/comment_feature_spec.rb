require 'rails_helper'

feature 'comments' do
  before do
    sign_up(first_name="Joe",last_name="Bloggs",username="JB123",email="JB123@test.com",password="password")
    create_post
  end

  context 'creating comments' do
    it 'users can leave a comment' do
      fill_in "comment_text", with: 'Testing'
      click_button 'Comment'
      expect(current_path).to eq '/posts'
      expect(page).to have_content ('Testing')
    end
  end

  context 'viewing comments' do
    it 'allows users to see the name of the person who commented' do
      fill_in "comment_text", with: 'Hello, world!'
      expect(current_path).to eq '/posts'
      expect(page).to have_content ('Joe Bloggs')
    end
  end

  context 'clicking a users profile' do
    it 'allows you to visit a user\'s profile via clicking on their name when they leave a comment' do
      fill_in "comment_text", with: 'Hey there!'
      click_link 'Joe Bloggs'
      expect(page).to have_content ('JB123')
      expect(page).to_not have_content ('Hey there!')
    end
  end
end
