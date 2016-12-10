require 'rails_helper'

feature 'Sellers' do

	context 'signing up' do
		it 'creates a seller' do
			sign_up_seller("seller@one.com","password")
			expect(Seller.all.count).to eq 1
		end
	end

	context 'signing in', :js => true do
		it 'takes the seller to their homepage' do
			seller = Seller.create(email: "seller@one.com", password: "password")
			sign_in_seller(seller.email,seller.password)
			expect(page).to have_current_path(seller_profile_path(1))
		end
	end
end