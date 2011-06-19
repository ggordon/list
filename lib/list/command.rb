case ARGV[0]
when "-e", "--edit"
  List::Base.new().edit
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
