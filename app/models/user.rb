class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :student_pairs, :class_name => 'Pair', :foreign_key => 'student_id'
  has_many :match_pairs, :class_name => 'Pair', :foreign_key => 'match_id'

  has_many :users, through: :match_pairs, source: :student
  has_many :users, through: :student_pairs, source: :match

  has_many :pairs, dependent: :destroy

  scope :all_students, -> { where(admin: :false) }
  scope :all_admins, -> { where(admin: :true) }

  def admin?
    admin == true
  end

end
