Factory.define :snippet do |f|
  f.sequence(:title)     { |n| "Title #{n}"}
  f.code                "The moon and the stars"
end