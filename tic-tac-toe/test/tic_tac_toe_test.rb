require_relative "../lib/tic_tac_toe"

describe "tic tac toe" do
  it "finds horizontal winners" do
    input = [["x", "x", "x"],
             [" ", " ", " "],
             [" ", " ", " "]]

    expect(winner?(input)).to eq true
  end

  it "finds vertical winners" do
    input = [["o", " ", " "],
             ["o", " ", " "],
             ["o", " ", " "]]

    expect(winner?(input)).to eq true
  end

  it "is false when no winners exist" do
    input = [["o", " ", " "],
             [" ", " ", " "],
             ["o", " ", " "]]

    expect(winner?(input)).to eq false
  end

  it "finds diagonal winners" do
    input1 = [["x", " ", " "],
              [" ", "x", " "],
              [" ", " ", "x"]]

    input2 = [[" ", " ", "o"],
              [" ", "o", " "],
              ["o", " ", " "]]

    expect(winner?(input1)).to eq true
    expect(winner?(input2)).to eq true
  end
end
