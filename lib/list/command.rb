case ARGV[0]
when "-e", "--edit"
  system("vim ~/.list.data")
  STDOUT.puts "done editing"
when "-h", "--help"
  STDOUT.puts <<-EOF
Command line help message
list
list -e
list -h
EOF
else
  List::Base.new().render
end
