# encoding: utf-8

# Roles
# ////////////////////////////////////////////////////////////
admin       = Role.create(:name => 'Admin')
editor      = Role.create(:name => 'Editor')
registered  = Role.create(:name => 'Registered')

# Usuarios
# ////////////////////////////////////////////////////////////
u0 = User.create(:email => 'juanjicho@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'juanjo')
u1 = User.create(:email => 'patricia.garcia.gonzalez@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'patricia')
u2 = User.create(:email => 'fguillen.mail@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'fguillen')

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
#Post.create(:title => 'La comunidad R Hispana ya cuenta con nueva web', :content => 'Después de una larga espera, y grandes cambios en estos últimos tiempos, hoy ya, podemos anunciar el nuevo website de la comunidad R hispana.', :user => u0)