require 'test_helper'

describe List::Config  do

  it "should set the editor (default)" do
    config = List::Config.new
    assert_equal "vim -f", config.editor
  end

  it "should set the editor (override)" do
    config = List::Config.new(editor: "mate -w")
    assert_equal "mate -w", config.editor
  end

  it "should set the datafile (default)" do
    config = List::Config.new
    assert_equal "#{ENV['HOME']}/.list.list", config.datafile
  end

  it "should set the datafile (override)" do
    config = List::Config.new(datafile: "todo.list")
    assert_equal "todo.list", config.datafile
  end

  it "should set the category_hints" do
    config = List::Config.new
    h = {:overdue=>"!", :high=>"*", :med=>"-", :low=>".", :done=>"x", :unknown=>"?"}
    assert_equal h, config.category_hints
  end

end
