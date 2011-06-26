require 'tempfile'
require 'fileutils'

module List

  class Base

    def initialize(opts={})
      @config = Config.new(opts)
    end

    def render
      start_time = Time.now
      List::Renderer.new(@config).draw
      end_time = Time.now
      total_time = end_time - start_time
      puts
      puts "rendered in #{total_time} secs".green.bold
    end

    def edit
      List::Editor.new(@config).invoke
    end

  end
end
