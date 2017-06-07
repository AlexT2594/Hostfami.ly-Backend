require 'spec_helper'

RSpec.describe UsersController, type: :controller do

	describe "GET #show" do
		before(:each){ @test_user=FactoryGirl.create(:student)}
		before(:each) { get :show, params: {id: 1} }

		it "should return a user with type=student" do
			#print @test_user.to_json
			#print json["user"]["type"]
			#expect(json).to have_key('user')
			#user = { :user => FactoryGirl.attributes_for(:student)}
			expect(json["user"]["type"]).to be == "Student"
		end

		it { should respond_with 200 }
	end

	describe "POST #create" do
		context "with valid attributes" do
			it "creates a new user" do
				user = { :user => FactoryGirl.attributes_for(:student)}
				user[:user][:utype] = "student"
				#print user
				post :create, params: user
				#print json
				expect(json["student"]["email"]).to be == user[:user][:email]
			end
		end

		context "with invalid attributes" do
			it "returns an error" do
				user = {:user => FactoryGirl.attributes_for(:invalid_user)}
				#print user
				post :create, params: user
				#print json
				expect(json).to have_key("errors")
			end
		end
	end

	describe "GET #confirm_email" do
		context "with valid attributes" do
			it "returns json with result=success" do
				test_user=FactoryGirl.create(:student)
				get :confirm_email, params:  {tk: test_user.confirm_token}
				#print json
				expect(json["result"]).to be == "success" 
			end
		end

		context "with invalid attributes" do
			it "returns json with result=error" do
				test_user=FactoryGirl.create(:student)
				get :confirm_email, params:  {tk: 1}
				#print json
				expect(json["result"]).to be == "error" 
			end
		end
	end

end
