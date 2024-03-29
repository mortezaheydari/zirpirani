module UsersHelper

  def make_admin(user)
    current_user ||= ""
    if !current_user.empty? && current_user.has_role?(:super_admin)
      user.add_role :admin
      user.save
    else
      return false
    end
  end

  def kick_admin(user)
    current_user ||= ""
    if !current_user.empty? && current_user.has_role?(:super_admin)
      user.remove_role :admin
      user.save
    else
      return false
    end
  end

end
