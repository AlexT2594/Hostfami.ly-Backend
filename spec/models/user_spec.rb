require 'spec_helper'

RSpec.describe User, type: :model do
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
end
