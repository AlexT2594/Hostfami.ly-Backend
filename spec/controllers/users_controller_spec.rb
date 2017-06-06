require 'spec_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
		test_user = FactoryGirl.create(:user)
		before(:each) { get :show, params: {id: 1} }

		it { should respond_with 200 }
	end

end
