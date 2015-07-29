require_relative '../lib/mini_golf'

describe "#display_scores" do
  it "displays the scores in the correctly" do
    sample_file = File.join(File.dirname(__FILE__), 'scores.csv')

    expected_output = <<-eos
Mini Golf Scores

1. Eric with 21 strokes.
2. Helen with 22 strokes.
3. Dan with 26 strokes.
4. Jason with 27 strokes.
5. Adam with 27 strokes.
6. Sam with 30 strokes.
7. Bill with 31 strokes.
8. Evan with 32 strokes.
9. Faizaan with 79 strokes.
    eos

    capture_output do
      display_scores(sample_file)
      expect($stdout.string).to eq expected_output
    end
  end
end

def capture_output(&block)
  original_stdout = $stdout
  $stdout = fake_stdout = StringIO.new
  original_stderr = $stderr
  $stderr = fake_stderr = StringIO.new

  begin
    yield
  ensure
    $stdout = original_stdout
    $stderr = original_stderr
  end

  [fake_stdout.string, fake_stderr.string]
end
