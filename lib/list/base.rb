require 'tempfile'
require 'fileutils'
require 'colored'

module List

  class Base
    include Colored

    def initialize
      @list_list = ENV['LIST_LIST'] || "#{ENV['HOME']}/.list.list"
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
          print_line $2, :high
        when /(^[mM] )(.*)$/
          print_line $2, :med
        when /(^[lL] )(.*)$/
          print_line $2, :low
        when /(^[xX] )(.*)$/
          print_line $2, :done
        when /(^[?] )(.*)$/
          print_line $2, :unknown
        else
          print_line line, :unknown
        end
        @count += 1
      end
      puts
      puts "done rendering".green.bold
    end

    def print_line(str, category)
      label = List::CATEGORIES[category][:label]
      color = List::CATEGORIES[category][:color]
      # highlight projects
      str = str.gsub(/\+\w+/){ |w| w.underline }
      label = colorize(label, color)
      str = colorize(str, color)
      formatted = sprintf " %3{c}. %1{l} %{s}\n", c: @count, l: label, s: str
      print formatted
    end

  end
end
