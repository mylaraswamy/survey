class RegistrationsController < Devise::RegistrationsController

  def create
    super
    resource.add_role("user")
  end
end