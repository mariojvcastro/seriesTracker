class User < ActiveRecord::Base
validates :name, :presence => true, :uniqueness => true
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :update
validates :password, :confirmation => true
attr_accessor :password_confirmation
attr_reader   :password
validate   :password_must_be_present
has_many  :sent, 
                :class_name => "Message",
                :foreign_key  => "sent_id"
has_many  :received, 
                :class_name => "Message", 
                :foreign_key  => "received_id"
has_many :favorites, :dependent => :destroy
has_many :series, :through => :favorites


def User.authenticate(name, password)
  if user = find_by_name(name)
    if user.hashed_password == encrypt_password(password, user.salt)
      user
    end
  end
end
def User.encrypt_password(password, salt)
  Digest::SHA2.hexdigest(password + "wibble" + salt)
end
# 'password' is a virtual attribute
def password=(password)
  @password = password
  if password.present?
    generate_salt
    self.hashed_password = self.class.encrypt_password(password, salt)
  end
end

private
  def password_must_be_present
    errors.add(:password, "Missing password") unless hashed_password.present?
  end
  def generate_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


end
