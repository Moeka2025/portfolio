class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    resource.destroy
    Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
    set_flash_message! :notice, :destroyed
    redirect_to new_user_registration_path
  end
end