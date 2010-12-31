# Factory.define :user do |f|
#   f.sequence(:username)   { |n| "Tom #{n}"}
#   f.sequence(:email)      { |n| "test@email#{n}.com"}  
#   f.password              "666666"
#   f.password_confirmation "666666"  
# end

Factory.define :role do |f|
  f.name               "Superman"
end

Factory.define :snippet do |f|
  f.sequence(:title)     { |n| "Snippet #{n}"}
  f.code                "The moon and the stars"
end

Factory.define :job_offer do |f|
  f.sequence(:title)      { |n| "Job Offer #{n}"}
  f.description           "The moon and the stars"
  f.company               "Apple Inc."
  # f.association           :user
end