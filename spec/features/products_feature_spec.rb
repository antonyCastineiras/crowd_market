require 'rails_helper'

feature 'Products' do

  context 'New products' do

    before do
      sign_up_seller('123@mail.com', 'abc123')
    end

    scenario 'Seller can add a product', js: true do
      add_product
      expect(page).to have_content('Product')
      expect(page).to have_content('Product description')
      expect(page).to have_content('Price: £500.0')
    end

    scenario 'user can edit post', js: true do
      add_product
      click_link 'Update this product'
      fill_in 'product[product_name]', with: 'New product name'
      click_button 'Update Product'
      expect(page).to have_content('New product name')
    end
  end
end
