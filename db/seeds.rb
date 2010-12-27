# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

u1 = User.create(:email => 'admin@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'admin')
u2 = User.create(:email => 'editor@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'editor')
u3 = User.create(:email => 'registered@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'registered')

admin = Role.create(:name => 'Admin')
editor = Role.create(:name => 'Editor')
registered = Role.create(:name => 'Registered')

u1.roles << admin
u2.roles << editor
u3.roles << registered

Snippet.create(:description => 'S1', :user => u3, :code => 'C1', :title => 'Reading and writing both ascii files and binary files. Also, measure speed of these')
Snippet.create(:description => 'S2', :user => u3, :code => 'C2', :title => 'Reading a file with a few columns of numbers, and look at what is there.')
Snippet.create(:description => 'S3', :user => u2, :code => 'C3', :title => 'Show recessions using filled colour in a macro time-series plot')
Snippet.create(:description => 'S4', :user => u2, :code => 'C4', :title => 'Two CDFs and a two-sample Kolmogorov-Smirnoff test')
Snippet.create(:description => 'S5', :user => u1, :code => 'C5', :title => 'Four standard operations with standard distributions')

JobOffer.create(:title => 'Offer 1', :user => u1, :description => 'd1')
JobOffer.create(:title => 'Offer 2', :user => u2, :description => 'd2')
JobOffer.create(:title => 'Offer 3', :user => u2, :description => 'd3')
JobOffer.create(:title => 'Offer 4', :user => u3, :description => 'd4')
JobOffer.create(:title => 'Offer 5', :user => u3, :description => 'd5')