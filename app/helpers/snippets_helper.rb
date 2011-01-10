require 'uv'
module SnippetsHelper
  
  CLEANER_REGEXS = { :video => /!\[Video\]\(youtube:[a-zA-Z0-9\-\_]*\)/,
                     :image => /!\[.*\]\(.+\ ".+"\)/ }
  
  def truncate_snippet(thought, wordcount, clean = false)
    return ''  if thought.blank?
    thought = regex_cleaner(thought) if clean
    thought.split[0..(wordcount - 1)].join(" ") + (thought.split.size > wordcount ? "..." : "")
  end
  
  def parse_uv(code, theme)
    Uv.parse(code, "xhtml", "r", true, theme).html_safe
  end
  
  def regex_cleaner(text)
    SnippetsHelper::CLEANER_REGEXS.each_value do |value|
      text = text.gsub(value, '')
    end
    return text
  end
  
end
