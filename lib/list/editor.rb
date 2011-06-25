require 'forwardable'

module List

  class Editor
    extend Forwardable

    def_delegator :@config, :datafile
    def_delegator :@config, :databak
    def_delegator :@config, :editor

    def initialize(config)
      @config = config
    end

    def invoke
      FileUtils.cp(datafile, databak)
      system("#{editor} #{datafile}")

      high = Hash.new
      med  = Hash.new
      low  = Hash.new
      done = Hash.new

      temp = Tempfile.new("list_list")
      File.foreach(datafile) do |line|
        temp << line
      end
      temp.close
      FileUtils.mv(temp.path, datafile)
      puts "done editing"
    end

  end
end
