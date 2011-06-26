require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: list [options]"
  opts.on("-e", "--edit", "Edit list") do |e|
    options[:edit] = e
  end
  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

if options.has_key? :edit
  List::Base.new().edit
else
  List::Base.new().render
end
