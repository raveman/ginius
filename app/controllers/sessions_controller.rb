class SessionsController < Devise::SessionsController 
	# clear_respond_to  
	# respond_to :json
	respond_to :html, :json
end
