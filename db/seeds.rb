# encoding: utf-8

Role::ROLES.each_value do |role|
  Role.create(:name => role)
end

# Usuarios
# ////////////////////////////////////////////////////////////
u0 = User.create(:email => 'juanjicho@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'juanjo')
u1 = User.create(:email => 'patricia.garcia.gonzalez@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'patricia')
u2 = User.create(:email => 'fguillen.mail@gmail.com', :password => 'XXXXXX', :password_confirmation => 'XXXXXX', :username => 'fguillen')


u0.confirm!
u1.confirm!
u2.confirm!

u0.roles << Role[:admin]
u1.roles << Role[:admin]
u2.roles << Role[:admin]

# Tipos de trabajo
# ////////////////////////////////////////////////////////////
jt1 = JobType.create(:name => 'Tiempo completo')
jt2 = JobType.create(:name => 'Tiempo parcial')
jt3 = JobType.create(:name => 'Teletrabajo')
jt4 = JobType.create(:name => 'Proyecto')
