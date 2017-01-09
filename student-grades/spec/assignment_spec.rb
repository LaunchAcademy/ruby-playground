require_relative "../lib/student"
require_relative "../lib/assignment"
require_relative "../lib/grade"

describe Assignment do
  before :each do
    @assignment = Assignment.new("Git Quiz", "10/24/2014")
    grade_attrs = [
      { student: "Adam Sheehan", score: 100 },
      { student: "Eric Kelly", score: 84 },
      { student: "Richard Beastmaster", score: 97 }
    ]

    grade_attrs.each do |grade|
      student = Student.new(grade[:student])
      @assignment.grades << Grade.new(@assigment, student, grade[:score])
    end
  end

  it "has a name" do
    expect(@assignment.name).to eq("Git Quiz")
  end

  it "has a due date" do
    expect(@assignment.due_date).to eq("10/24/2014")
  end

  it "has a set of recorded grades" do
    expect(@assignment.grades.count).to eq(3)
  end

  describe "#average_grade" do
    it "returns the average grade for the assignment" do
      expect(@assignment.average_grade).to be_within(0.001).of(93.7)
    end

    it "returns a message if no grades are recorded" do
      assignment = Assignment.new("Fake Assignment", "12/14/2014")
      expect(assignment.average_grade).to eq("no grades recorded")
    end
  end

  describe "#report" do
    it "returns summary information about the assignment" do
      report = "Assignment: Git Quiz\nDue date: 10/24/2014\nAverage Score: 93.7\n\nGRADES:\n\nAdam Sheehan, 100\nEric Kelly, 84\nRichard Beastmaster, 97\n"
      expect(@assignment.report).to eq(report)
    end
  end
end
