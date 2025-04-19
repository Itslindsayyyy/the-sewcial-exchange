class UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /account
  def show
    @user = current_user

    # Swaps the user is hosting
    @hosted_swaps = Swap.where(created_by_id: current_user.id)

    # Swaps the user is moderating or participating in
    group_memberships = GroupMembership.where(user_id: current_user.id)
    swap_group_ids = group_memberships.pluck(:swap_group_id)

    @role_lookup = group_memberships.each_with_object({}) do |membership, hash|
      hash[membership.swap_group_id] = membership.group_role
    end

    @joined_swaps = Swap.where(swap_group_id: swap_group_ids)

    # Combine hosted + joined swaps and remove duplicates
    @all_user_swaps = (@hosted_swaps + @joined_swaps).uniq
  end


  # PATCH /account
  def update
    @user = current_user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to account_path, notice: "Your profile was successfully updated." }
        format.json { render :show, status: :ok, location: account_path }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :address_line1, :address_line2,
      :city, :state, :zip, :instagram_url, :facebook_url,
      :display_name, :image
    )
  end
end
