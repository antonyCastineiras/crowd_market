def sign_up
  visit('users/sign_up')
  fill_in('user_first_name', with: 'Testy')
  fill_in('user_last_name', with: 'Tester')
  fill_in('Username', with: 'Test')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: '123456')
  fill_in('Password confirmation', with: '123456')
  click_button('Sign up')
end

def create_post
  visit '/posts'
  click_link 'Create a post'
  fill_in 'Text', with: 'Hello World!'
  click_button 'Create Post'
end

def like_post
  visit '/'
  click_link 'Like'
end

def sign_out
  click_link 'Sign out'
end  
