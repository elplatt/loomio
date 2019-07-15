class UserBreakoutsController < InheritedResources::Base

  private

    def user_breakout_params
      params.require(:user_breakout).permit(:user_id, :breakout_id)
    end
end

