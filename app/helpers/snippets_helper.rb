module SnippetsHelper
  def truncate_snippet(thought, wordcount)
    thought.split[0..(wordcount - 1)].join(" ") + (thought.split.size > wordcount ? "..." : "")
  end
end
