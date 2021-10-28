require "rails_helper"

RSpec.describe Book, type: :model do
  subject {
    described_class.new(name: "Book Title")
  }

  describe "Validations" do
    it {should belong_to(:author).without_validating_presence}
  end

  describe "Validation" do
    it "is not valid without name" do
      expect(subject).to be_valid
    end

    it "is not valid without minimum 3 character name" do
        subject.name = "ab"
        expect(subject).to_not be_valid
    end
end
