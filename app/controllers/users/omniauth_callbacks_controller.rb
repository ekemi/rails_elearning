class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Github") if is_navigational_format?
      else
        session["devise.github_data"] = request.env["omniauth.auth"].except(:extra) # Removing extra as it can overflow some session stores
        redirect_to new_user_registration_url
      end
    end
    def failure 
      redirect_to root_path
    end
  
    # protected
  
    # def after_omniauth_failure_path_for(_scope)
    #   new_user_session_path
    # end
  
    # def after_sign_in_path_for(resource_or_scope)
    #   stored_location_for(resource_or_scope) || root_path
    # end
  
    # private
  
    # def from_google_params
    #   @from_google_params ||= {
    #     uid: auth.uid,
    #     email: auth.info.email,
    #     full_name: auth.info.name,
    #     avatar_url: auth.info.image
    #   }
    # end
  
    # def auth
    #   @auth ||= request.env['omniauth.auth']
    # end
  end