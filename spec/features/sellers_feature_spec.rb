require 'rails_helper'

feature 'Sellers' do

	context 'signing up' do
		it 'creates a seller' do
			sign_up_seller("seller@one.com","password")
			expect(Seller.all.count).to eq 1
		end
	end
end