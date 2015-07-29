require_relative "../lib/student"
require_relative "../lib/assignment"
require_relative "../lib/grade"

describe Grade do
  let(:student) { Student.new("Richard Beastmster") }
  let(:assignment) { Assignment.new("Git Quiz", "10/24/2014") }
  let(:grade) { Grade.new(assignment, student, 98) }

  it "has a student" do
    expect(grade.student).to eq(student)
  end

  it "has an assignment" do
    expect(grade.assignment).to eq(assignment)
  end

  it "has a score" do
    expect(grade.score).to eq(98)
  end
end
