require 'uv'
module SnippetsHelper
  def truncate_snippet(thought, wordcount)
    thought.split[0..(wordcount - 1)].join(" ") + (thought.split.size > wordcount ? "..." : "")
  end
  
  def parse_uv(code, theme)
    Uv.parse(code, "xhtml", "r", true, theme).html_safe
  end
end
