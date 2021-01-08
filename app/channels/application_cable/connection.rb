module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      # byebug
      self.current_user = find_verified_user
    end

    private

    def find_verified_user
      # byebug
      if current_user = User.find_by(id: JWT.decode(cookies["X-Authorization"], ENV["JWT_SECRET"], false)[0]['user_id'])
        current_user
      else
        reject_unauthorized_connection
      end
    end

  end
end
