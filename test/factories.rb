Factory.define :user do |f|
  f.sequence(:username)   { |n| "Tom #{n}"}
  f.sequence(:email)      { |n| "test@email#{n}.com"}
  f.password              "666666"
  f.password_confirmation "666666"
end

Factory.define :role do |f|
  f.name               "Superman"
end

Factory.define :snippet do |f|
  f.sequence(:title)     { |n| "Snippet #{n}"}
  f.code                "The moon and the stars"
end

Factory.define :job_type do |f|
  f.name               "Slave"
end

Factory.define :job_offer do |f|
  f.sequence(:title)      { |n| "Job Offer #{n}"}
  f.description           "The moon and the stars"
  f.company               "Apple Inc."
  # f.association           :user
end

Factory.define :post do |f|
  f.sequence(:title)     { |n| "Title #{n}"}
  f.content              ("A" * 25)
end

Factory.define :country do |f|
  f.name "Spain"
  f.isonum 724
  f.iso2 'ES'
  f.iso3 'ESP'
end