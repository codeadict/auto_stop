class CreateAdminService
  def call
    user = User.find_or_create_by!(email: 'autostop@tvcable.net.ec') do |user|
        user.password = 'autostopadmin'
        user.password_confirmation = 'autostopadmin'
        user.confirm!
      end
  end
end
