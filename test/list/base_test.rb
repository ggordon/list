require 'test_helper'

require 'stringio'

# capture stdout
module Kernel
  def capture_stdout
    out = StringIO.new
    $stdout = out
    yield
    return out
  ensure
    $stdout = STDOUT
  end
end

describe List::Base do

  def setup
    @datafile = "test/data/datafile"
  end

  it "should create a list object" do
    assert List::Base.new
  end

  it "should display the list" do
    opts = { datafile: @datafile }
    results = capture_stdout do
      List::Base.new(opts).render
    end
    assert_match "write more tests", results.string
  end

  it "should edit the list" do
    opts = { datafile: @datafile, editor: "cat >/dev/null" }
    results = capture_stdout do
      List::Base.new(opts).edit
    end
    assert_match "done editing", results.string
  end

end
