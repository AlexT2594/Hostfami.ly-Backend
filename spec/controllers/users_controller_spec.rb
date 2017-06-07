require 'spec_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
		before(:each){ @test_user=FactoryGirl.create(:student)}
		before(:each) { get :show, params: {id: 1} }

		it "returns the informations of the user with id=1" do
			print @test_user.to_json
			print json["user"]["type"]
			expect(json).to have_key('user')
		end

		it { should respond_with 200 }
	end

end
