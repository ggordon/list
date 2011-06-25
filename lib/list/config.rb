module List
  class Config

    attr_reader :editor
    attr_reader :datafile
    attr_reader :databak

    def initialize(opts={})
      @editor   = opts.fetch(:editor, nil) || "vim -f"
      @datafile = opts.fetch(:datafile, nil) || "#{ENV['HOME']}/.list.list"
      @databak  = "#{@datafile}.bak"
    end


    # TODO - how to override
    def categories
      @categories = {
        overdue: { label: '!',
                   color: { foreground: 'red' }},
        high:    { label: '*',
                   color: { foreground: 'magenta' }},
        med:     { label: '-',
                   color: { foreground: 'blue' }},
        low:     { label: '.',
                   color: { foreground: 'magenta', extra: 'bold' }},
        done:    { label: 'x',
                   color: { foreground: 'green' }},
        unknown: { label: '?',
                   color: { foreground: 'green', extra: 'bold' }},
      }
    end

    # build quick hints based on the categories
    def category_hints
      return @category_hints if defined? @category_hints
      @category_hints = categories.inject({}) do |hash, category|
        hash[category.first] = category.last.fetch(:label)
        hash
      end
    end

  end
end
