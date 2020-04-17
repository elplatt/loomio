module CurrentUserHelper
  include PendingActionsHelper

  def sign_in(user)
    puts "signing in"
    @current_user = nil
    user = UserService.verify(user: user)
    puts user.to_s
    super(user) && handle_pending_actions(user)
  end

  def current_user
    puts "current user"
    puts "@current_user: " + @current_user.to_s
    puts "token_user: " + token_user.to_s
    puts "super: " + super.to_s
    puts super.class
    puts "restricted_user: " + restricted_user.to_s
    @current_user ||= token_user || super || restricted_user || LoggedOutUser.new(locale: logged_out_preferred_locale)
  end

  private

  def token_user
    return unless doorkeeper_token.present?
    doorkeeper_render_error unless valid_doorkeeper_token?
    User.find(doorkeeper_token.resource_owner_id)
  end

  def restricted_user
    User.find_by!(params.slice(:unsubscribe_token).permit!).tap { |user| user.restricted = true } if params[:unsubscribe_token]
  end

  def set_last_seen_at
    current_user.update_attribute :last_seen_at, Time.now
  end
end
