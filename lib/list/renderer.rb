require 'colored'
require 'forwardable'

module List

  class Renderer
    extend Forwardable
    include Colored

    def_delegator :@config, :datafile
    def_delegator :@config, :categories

    def initialize(config)
      @config = config
    end

    def draw
      puts
      @count = 1
      File.foreach(datafile) do |line|
        case line
        when /(^[\*] )(.*)$/
          print_line $2, :high
        when /(^[\-] )(.*)$/
          print_line $2, :med
        when /(^[\.] )(.*)$/
          print_line $2, :low
        when /(^[xX] )(.*)$/
          print_line $2, :done
        when /(^[\?] )(.*)$/
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
      label = categories[category][:label]
      color = categories[category][:color]
      # highlight projects
      str = str.gsub(/\+\w+/){ |w| w.underline }
      label = colorize(label, color)
      str = colorize(str, color)
      formatted = sprintf " %3{c}. %1{l} %{s}\n", c: @count, l: label, s: str
      print formatted
    end

  end
end
