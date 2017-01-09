require_relative "../lib/student"
require_relative "../lib/assignment"
require_relative "../lib/grade"

describe Student do
  before :each do
    @student = Student.new("Richard Beastmaster")
    assignment_attrs = [
      { name: "Git Quiz", due_date: "10/24/2014", score: 98 },
      { name: "Slacker News", due_date: "12/4/2014", score: 98 },
      { name: "Meetups In Space", due_date: "11/18/2014", score: 87 },
      { name: "Rescue Mission", due_date: "11/1/2014", score: 100 }
    ]

    assignment_attrs.each do |a|
      assignment = Assignment.new(a[:name], a[:due_date])
      grade = Grade.new(assignment, @student, a[:score])
      @student.grades << grade
    end
  end

  it "has a name" do
    expect(@student.name).to eq("Richard Beastmaster")
  end

  it "has a set of grades" do
    expect(@student.grades.count).to eq(4)
  end

  describe "#average_grade" do
    it "returns the average grade" do
      expect(@student.average_grade).to be_within(0.001).of(95.75)
    end

    it "returns a message if no grades are recorded" do
      student = Student.new("Barry Zuckercorn")
      expect(student.average_grade).to eq("no grades recorded")
    end
  end

  describe "#report_card" do
    it "lists out all the student's grades" do
      report_card = "Name: Richard Beastmaster\nAverage Grade: 95.75\n\nGrades:\n\nGit Quiz (10/24/2014) - 98\nSlacker News (12/4/2014) - 98\nMeetups In Space (11/18/2014) - 87\nRescue Mission (11/1/2014) - 100\n"
      expect(@student.report_card).to eq(report_card)
    end
  end
end
