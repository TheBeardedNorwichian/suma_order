module GroupsHelper

  def current_group
    current_user.group
  end

end
