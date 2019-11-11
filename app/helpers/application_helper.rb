module ApplicationHelper


    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end

end
