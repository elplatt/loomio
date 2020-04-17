module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      puts "ApplicationCable::connect"
      puts self.current_user
      self.current_user = user || membership || reject_unauthorized_connection
      puts self.current_user
    end

    private
    def user
      env['warden'].user
    end

    def membership
      LoggedOutUser.new(token: request.params[:token]) if request.params[:token]
    end
  end
end
