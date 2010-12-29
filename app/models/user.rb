class User < ActiveRecord::Base
  delegate :can?, :cannot?, :to => :ability

  has_and_belongs_to_many :roles
  has_many :snippets, :order => 'created_at DESC'
  has_many :job_offers, :order => 'created_at DESC'
  has_many :posts, :order => 'created_at DESC'

  validates_presence_of :username
  validates_uniqueness_of :username
  validates_length_of :username, :in => 2..10

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username

  scope :confirmed, where('confirmed_at IS NOT NULL')
  scope :unconfirmed, where('confirmed_at IS NULL')  

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end

  private

    def ability
      @ability ||= Ability.new(self)
    end

end
