class API::BootController < API::RestfulController
  def site
    render json: Boot::Site.new.payload
  end

  def user
    puts "boot/user"
    puts current_user
    puts serialized_pending_identity
    render json: Boot::User.new(current_user, identity: serialized_pending_identity, flash: flash).payload
  end
end
