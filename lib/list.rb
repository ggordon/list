require "list/version"
require "list/base"

module List

  CATEGORIES = {
    overdue: { label: '!', color: { foreground: 'red' }},
    high:    { label: '*', color: { foreground: 'magenta' }},
    med:     { label: '-', color: { foreground: 'blue' }},
    low:     { label: '.', color: { foreground: 'magenta', extra: 'bold' }},
    done:    { label: 'x', color: { foreground: 'green' }},
    unknown: { label: '?', color: { foreground: 'green', extra: 'bold' }},
  }

end
