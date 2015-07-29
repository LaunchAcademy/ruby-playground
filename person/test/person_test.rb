require_relative "../lib/person"

describe Person do
  let(:person) { Person.new("John", "Smith") }

  describe "#first_name" do
    it "has a first name" do
      expect(person.first_name).to eq "John"
    end
  end

  describe "#last_name" do
    it "has a last name" do
      expect(person.last_name).to eq "Smith"
    end
  end

  describe "#full_name" do
    it "has a full name" do
      expect(person).to respond_to(:full_name),
        "It doesn't need to do anything yet but you need a #full_name method!"
    end

    it "combines first name and last name" do
      expect(person.full_name).to eq "John Smith"
    end
  end
end
