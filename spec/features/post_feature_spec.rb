require 'rails_helper'

feature 'posts' do

  context 'no posts have yet been created' do
    scenario 'should display create a post' do
      visit '/posts'
      expect(page).to have_content 'No posts have been added!'
      expect(page).to have_link 'Create a post'
    end
  end

  context 'post has been created' do
    before do
      Post.create(text: 'Hello World!')
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

    let!(:hello_world){ Post.create(text:'Hello world!') }
    scenario 'lets a user view a post' do
      visit '/posts'
      click_link 'Hello world!'
      expect(page).to have_content 'Hello world!'
      expect(current_path).to eq "/posts/#{hello_world.id}"
    end
  end

  context 'editing posts' do

    before { Post.create text: 'Hello'}
    scenario 'let a user edit a post' do
      visit '/posts'
      click_link 'Edit Hello'
      fill_in 'Text', with: 'Goodbye'
      click_button 'Update Post'
      expect(page).to have_content 'Goodbye'
      expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do
    before { Post.create text: 'Hello'}
    scenario 'removes a post when a user clicks delete' do
      visit '/posts'
      click_link 'Delete'
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Post deleted'
      expect(page).not_to have_content 'Hello'
    end
  end

end
