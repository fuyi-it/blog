require 'rubygems'
require 'maruku'

class MarkdownWrapper
  def before_save(record)
    #record.body_html = Maruku.new(record.body_markdown).to_html
    record.body_html =record.body_markdown
  end
end