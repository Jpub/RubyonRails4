class User < ActiveRecord::Base
  has_one :author
  has_many :reviews
  has_many :books, through: :reviews

  # attr_protected :roles

  # validates :agreement, acceptance: true
  # validates :agreement, acceptance: { accept: 'yes' }
  # validates :agreement, acceptance:{ on: :create }
  # validates :email, confirmation: true
  # validates :email, presence: { unless: 'dm.blank?' }
  # validates :email, presence: { if: '!dm.blank?' }
  # validates :email, presence: { unless: :sendmail? }
  # validates :email,
  #   presence: { unless: Proc.new { |u| u.dm.blank? } }
  # with_options unless: 'dm.blank?' do |dm|
  #   dm.validates :email, presence: true
  #   dm.validates :roles, presence: true
  # end

  def self.authenticate(username, password)
    usr = find_by(username: username)
    if usr != nil &&
      usr.password == Digest::SHA1.hexdigest(usr.salt + password) then
      usr
    else
      return
    end
  end

  # def sendmail?
  #   dm.blank?
  # end
end
