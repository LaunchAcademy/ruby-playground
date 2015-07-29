require_relative '../lib/distance_between_points'

describe "#distance" do
  it "finds the distance between two points that are the same" do
    point1 = [0, 0]
    point2 = [0, 0]

    expect(distance(point1, point2)).to eq 0
  end

  it "finds the distance between two points" do
    point1 = [0, 0]
    point2 = [3, 0]

    expect(distance(point1, point2)).to eq 3
  end

  it "finds the distance between points with negative" do
    point1 = [0, 0]
    point2 = [-5, 0]

    expect(distance(point1, point2)).to eq 5
  end

  it "rounds the distance to 3 decimal places" do
    point1 = [0, 0]
    point2 = [-3, 1]

    expect(distance(point1, point2)).to eq 3.162
  end
end
