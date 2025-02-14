class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:user, :vip, :admin]

  has_many :posts
  before_save :set_default_role
  after_initialize :set_default_role#, :if => :new_record?

  private

  def set_default_role
    self.role ||= :user
  end
end
