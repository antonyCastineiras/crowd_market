def sign_up(first_name, last_name, username, email, password)
  visit('users/sign_up')
  fill_in('user_first_name', with: first_name)
  fill_in('user_last_name', with: last_name)
  fill_in('Username', with: username)
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def create_post
  visit '/posts'
  click_link 'Create a post'
  fill_in 'Text', with: 'Hello World!'
  click_button 'Create Post'
end
