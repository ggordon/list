require 'tempfile'
require 'fileutils'

module List

  class Base

    def initialize(opts={})
      @config = Config.new(opts)
    end

    def render
      List::Renderer.new(@config).draw
    end

    def edit
      List::Editor.new(@config).invoke
    end

  end
end
