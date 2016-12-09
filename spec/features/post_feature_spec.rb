require 'rails_helper'

feature 'posts' do
  before do
    sign_up(first_name="Dave",last_name="Jones",username="DJ246",email="DJ246@test.com",password="password")
    @user = User.create(email: 'abc@123.com', password: '123456')
  end

  context 'no posts have yet been created' do
    scenario 'should display create a post' do
      visit '/posts'
      expect(page).to have_content 'No posts have been added!'
      expect(page).to have_link 'Create a post'
    end
  end

  context 'post has been created' do
    before do
      create_post
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Hello World!')
      expect(page).not_to have_content('No posts have been added!')
    end

  end

  context 'creating posts' do
    scenario 'user can create a post' do
      visit '/posts'
      click_link 'Create a post'
      fill_in 'Text', with: 'Goodbye World!'
      click_button 'Create Post'
      expect(page).to have_content 'Goodbye World!'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    let!(:hello_world){ @user.posts.create(text:'Hello World!') }
    scenario 'lets a user view a post' do
      visit '/posts'
      expect(page).to have_content 'Hello World!'
    end
    scenario 'user can not click on post if image wasn\'t uploaded' do
      visit '/posts'
      expect(page).not_to have_link 'Hello World!'
    end
  end

  context 'editing posts' do
    scenario 'let a user edit a post' do
      create_post
      visit '/posts'
      click_link 'Edit'
      fill_in 'Text', with: 'Goodbye'
      click_button 'Update Post'
      expect(page).to have_content 'Goodbye'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    scenario 'removes a post when a user clicks delete' do
      create_post
      visit "/posts"
      page.first("glyphicon glyphicon-trash").click
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post deleted'
      expect(page).not_to have_content 'Hello'
    end
  end

  context 'viewing posts with names' do
    it 'allows users to see the name of the person who created the post' do
      create_post
      expect(current_path).to eq '/posts'
      expect(page).to have_content ('Dave Jones')
    end
  end

  context 'click a user\'s profile' do
    it 'allows you to visit a user\'s profile via clicking on their name when they leave a comment' do
      create_post
      visit '/posts'
      click_link 'Dave Jones'
      expect(page).to have_content ('DJ246')
      expect(page).not_to have_content ('Hello World!')
    end
  end
end
