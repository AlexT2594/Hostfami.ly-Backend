require 'spec_helper'

RSpec.describe User, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  it "is invalid without a firstname" do
    expect(FactoryGirl.build(:user,firstname: nil)).not_to be_valid
  end

  it "does not allow users with email different than email_confirmation" do
    expect(FactoryGirl.build(:user,email: "a@a.it", email_confirmation: "a@b.it")).not_to be_valid
  end

  it "does not allow users with password different than password_confirmation" do
    expect(FactoryGirl.build(:user,password: "Pass123", password_confirmation: "Pass23")).not_to be_valid
  end
=begin

  subject {
    described_class.new(firstname: "Pippo", email: "pi@pi.it",
                        password: "foobar", password_confirmation: "foobar")
  }

  it "is valid with valid attributes" do
    expect(subject).to_not be_valid
  end

  it "should have a name" do
    subject.firstname = "     "
    expect(subject).to_not be_valid
  end

  it "should have an email" do
    subject.email = "   "
    expect(subject).to_not be_valid
  end

  it "should have a name with less than 51 chars" do
    subject.firstname = "a" * 51
    expect(subject).to_not be_valid
  end

  it "should have an email with less than 255 chars" do
    subject.firstname = "a" * 255 + "@example.com"
    expect(subject).to_not be_valid
  end

=end
end
