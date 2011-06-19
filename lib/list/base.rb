require 'tempfile'
require 'fileutils'
require 'colored'

module List

  class Base

    def initialize
      @list_list = ENV['LIST_LIST'] || "~/.list.list"
      @list_bak  = "#{@list_list}.bak"
    end

    def edit
      FileUtils.cp(@list_list, @list_bak)
      system("vim #{@list_list}")

      high = Hash.new
      med  = Hash.new
      low  = Hash.new
      done = Hash.new

      temp = Tempfile.new("list_list")
      File.foreach(@list_list) do |line|
        temp << line
      end
      temp.close
      FileUtils.mv(temp.path, @list_list)
      puts "done editing"
    end

    def render
      puts
      @count = 1
      File.foreach(@list_list) do |line|
        case line
        when /(^[hH] )(.*)$/
          high $2
        when /(^[mM] )(.*)$/
          med $2
        when /(^[lL] )(.*)$/
          low $2
        when /(^[xX] )(.*)$/
          done $2
        when /(^[?] )(.*)$/
          unknown $2
        else
          unknown line
        end
        @count += 1
      end
      puts "done rendering".green.bold
      puts
    end

    def print_line(label, str)
      # highlight projects
      str = str.gsub(/\+\w+/){ |w| w.underline }
      printf " %3{c}. %4{l} %{s}\n", c: @count, l: label, s: str
    end
    def high str
      print_line 'HIGH'.magenta, str
    end
    def med str
      print_line 'MED '.blue, str
    end
    def low str
      print_line 'LOW '.magenta.bold, str
    end
    def done str
      print_line 'DONE'.green, str
    end
    def unknown str
      print_line '?   '.red.bold, str
    end


  end
end
