require "rails_helper"

RSpec.describe Author, type: :model do
  subject {
    described_class.new(
      name: "Author Name",
      email: "test@gmail.com",

    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without minimum 3 character name" do
    subject.name = "ab"
    expect(subject).to_not be_valid
  end

  it "is not valid without minimum 3 character email" do
    subject.email = "ab"
    expect(subject).to_not be_valid
  end
end
