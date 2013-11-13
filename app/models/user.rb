class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable

  has_many :auth_providers, dependent: :destroy
  has_many :petitions, dependent: :destroy

  def add_auth_provider(h)
    raise "Invalid auth hash" unless h
    # if the user already has this provider linked
    existing_provider = self.auth_providers.where( 'ap_name = ?', h[:ap_name] ).first
    existing_provider.destroy if existing_provider
    self.auth_providers.create(
      :ap_name => h[:ap_name],
      :ap_uid => h[:uid], 
      :ap_uname => h[:uname], 
      :ap_uemail => h[:uemail],
      :ap_upicture => h[:upicture],
      :ap_uprofile => h[:uprofile],
      :raw => h[:raw])
    if self.auth_providers.count == 1
      # If this is this user's only auth provider, we set his username and avatar
      self.picture = h[:upicture]
      self.email = h[:uemail]
    end
  end
end
