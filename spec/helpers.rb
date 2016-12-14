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

def sign_up_user_2
  visit('users/sign_up')
  fill_in('user_first_name', with: 'User')
  fill_in('user_last_name', with: 'User2')
  fill_in('Username', with: 'User2')
  fill_in('Email', with: 'user2@mail.com')
  fill_in('Password', with: '123456')
  fill_in('Password confirmation', with: '123456')
  click_button('Sign up')
end

def sign_up_seller(email,password)
  visit('/sellers/sign_up')
  fill_in("Email", with: email)
  fill_in("Password", with: password)
  fill_in("seller_password_confirmation", with: password)
  click_button('Sign up')
end

def sign_in_seller(email,password)
  visit('/sign_in')
  page.evaluate_script("$('#seller-form').show()")
  fill_in("seller_email", with: password)
  fill_in("seller_password", with: password)
  print page.html
  click_button("seller-log-in-button")
end

def create_post
  visit '/posts'
  click_link 'Create a post'
  fill_in 'Text', with: 'Hello World!'
  attach_file('post[image]', './app/assets/images/practice_image.jpg')
  click_button 'Create Post'
end

def comment_post
  visit '/posts'
  fill_in "comment_text", with: 'Testing'
  click_button 'Comment'
end

def like_post
  visit '/'
  click_link 'Like'
end

def sign_out
  click_link 'Sign out'
end

def add_product
  click_link 'Add a product'
  fill_in 'product[product_name]', with: 'Product'
  fill_in 'product[product_description]', with: 'Product description'
  fill_in 'product[price]', with: '500'
  fill_in 'product[sellers_fee]', with: '2'
  click_button 'Add Product'
end

def add_friend
  friend = User.create(email: "test2@test.com", password: "password", password_confirmation: "password")
  fill_in 'friend_email', with: friend.email
  click_button('Add Friend')
  click_link('Sign out')
  visit('/users/sign_in')
  fill_in 'Email', with: friend.email
  fill_in 'Password', with: friend.password
  click_button("Log in")
  click_link("Friend Requests")
  click_link("Accept Request")
end
