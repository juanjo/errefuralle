# encoding: utf-8

# Roles
# ////////////////////////////////////////////////////////////
admin       = Role.create(:name => 'Admin')
editor      = Role.create(:name => 'Editor')
registered  = Role.create(:name => 'Registered')

# Usuarios
# ////////////////////////////////////////////////////////////
u0 = User.create(:email => 'juanjicho@gmail.com', :password => '219921', :password_confirmation => '219921', :username => 'juanjo')
u1 = User.create(:email => 'patricia.garcia.gonzalez@gmail.com', :password => 't3qu13r0', :password_confirmation => 't3qu13r0', :username => 'patricia')
u2 = User.create(:email => 'fguillen.mail@gmail.com', :password => 'pepe', :password_confirmation => 'pepe', :username => 'fguillen')

u0.confirm!
u1.confirm!
u2.confirm!

u0.roles << admin
u1.roles << admin
u2.roles << admin

# Tipos de trabajo
# ////////////////////////////////////////////////////////////
jt1 = JobType.create(:name => 'Tiempo completo')
jt2 = JobType.create(:name => 'Tiempo parcial')
jt3 = JobType.create(:name => 'Teletrabajo')
jt4 = JobType.create(:name => 'Proyecto')

# Mini-Noticias
# ////////////////////////////////////////////////////////////
Post.create(:title => 'La comunidad R Hispana ya cuenta con nueva web', :content => 'Después de una larga espera, y grandes cambios en estos últimos tiempos, hoy ya, podemos anunciar el nuevo website de la comunidad R hispana.', :user => u0)

# u2 = User.create(:email => 'editor@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'editor')
# u3 = User.create(:email => 'registered@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'registered')
# 
# u4 = User.create(:email => 'admisn@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'admins')
# u5 = User.create(:email => 'editsor@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'editsor')
# u6 = User.create(:email => 'regisstered@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'resgistered')
# u7 = User.create(:email => 'admins@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'admsin')
# u8 = User.create(:email => 'editsor@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'edistor')
# u9 = User.create(:email => 'regisstered@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'registesred')
# u10 = User.create(:email => 'admsin@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'adsmin')
# u11 = User.create(:email => 'edistor@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'esditor')
# u12 = User.create(:email => 'regisstered@erre.com', :password => '219921', :password_confirmation => '219921', :username => 'regsistered')
# 
# 
# u2.confirm!
# u3.confirm!
# 
# u2.roles << registered
# u2.roles << editor
# u2.roles << admin
# u3.roles << registered
# 
# Snippet.create(:description => 'S1', :user => u3, :code => 'C1', :title => 'Reading and writing both ascii files and binary files. Also, measure speed of these')
# Snippet.create(:description => 'S2', :user => u3, :code => 'C2', :title => 'Reading a file with a few columns of numbers, and look at what is there.')
# Snippet.create(:description => 'S3', :user => u2, :code => 'C3', :title => 'Show recessions using filled colour in a macro time-series plot')
# Snippet.create(:description => 'S4', :user => u2, :code => 'C4', :title => 'Two CDFs and a two-sample Kolmogorov-Smirnoff test')
# Snippet.create(:description => 'S5', :user => u1, :code => 'C5', :title => 'Four standard operations with standard distributions')
# 
# 
# jt1 = JobType.create(:name => 'Tiempo completo')
# jt2 = JobType.create(:name => 'Tiempo parcial')
# jt3 = JobType.create(:name => 'Teletrabajo')
# jt4 = JobType.create(:name => 'Proyecto')
# 
# JobOffer.create(:title => 'Front End Developer', :user => u1, :description => 'd1', :job_type => jt1, :company => 'Google Inc')
# JobOffer.create(:title => 'Full-Stack Engineer (Ruby + MySQL + jQuery)', :user => u2, :description => 'd2', :job_type => jt2, :company => 'Sponsorpay')
# JobOffer.create(:title => 'PHP Developer (Drupal) for Workday Community', :user => u2, :description => 'd3', :job_type => jt3, :company => 'Youtube')
# JobOffer.create(:title => '"Rock Stars" and "Ninjas" Need Not Apply', :user => u3, :description => 'd4', :job_type => jt4, :company => 'Yahoo Enterprises')
# JobOffer.create(:title => 'Project Manager (get some Kanban in your life)', :user => u3, :description => 'd5', :job_type => jt1, :company => 'Sun Microsystems')
# 
# 
# Post.create(:title => 'Los toros', :content => 'Tests and Docs makes better code I just wrote an article about How I write Tests. I dont use TDD. Instead I follow a process that comes much more natural to me.', :user => u1)
# Post.create(:title => 'Las vacas',:content => 'Project Manager (get some Kanban in your life) Project Manager (get some Kanban in your life) Project Manager (get some Kanban in your life)', :user => u1)
# Post.create(:title => 'El campo', :content => 'Go to http://www.rubyonrails.org and say hello to david@loudthinking.com (get some Kanban in your life)', :user => u1)
# Post.create(:title => 'La leche', :content => 'Render views and partials outside controllers in Rails 3 Short blog post about using AbstractController::Base to render views and partials from within models, libraries etc.', :user => u1)