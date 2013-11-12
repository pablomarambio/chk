class SessionsController < ApplicationController
	def auth_callback
		provider = params[:provider]
		omniauth = request.env['omniauth.auth']
		Rails.logger.debug omniauth.to_yaml

		# continue only if hash and parameter exist
		return if omniauth.nil? or provider.nil?
				
		h = auth_provider_hash omniauth

		auth = AuthProvider.find_by_ap_name_and_ap_uid(provider, h[:uid])
		Rails.logger.debug "Auth provider found for user #{auth.user_id}" if auth
		Rails.logger.debug "No auth provider found for [#{provider}-#{h[:uid]}]" if auth.nil?

		if user_signed_in?
			# if this authentication provider is not linked to the account, add it
			if !auth
				current_user.add_auth_provider h
			else
				# Already added, do nothing
			end
		else
			# check if user has already signed in using this authentication provider and continue with sign in process if yes
			if auth
				sign_in auth.user
			else
				# at this point we are facing a new user... so he must be signing up
				Rails.logger.debug "Unknown user trying to log in"
				user = User.new
				user.save!
				user.add_auth_provider h
				sign_in user
			end
		end
		if session[:applying_to]
			redirect_to apply_event_path(session[:applying_to]) and return
		end
		redirect_to root_path
	end

	def auth_provider_hash omniauth
		hash = {}
		hash[:raw] = omniauth.to_xml
		hash[:uid] = omniauth['uid']
		hash[:uemail] = omniauth['info']['email']
		hash[:uname] = omniauth['info']['nickname']
		hash[:uprofile] = omniauth['info']['urls']['public_profile']
		hash[:upicture] = omniauth['info']['image']
		hash[:ap_name] = omniauth['provider']
		hash
	end
end