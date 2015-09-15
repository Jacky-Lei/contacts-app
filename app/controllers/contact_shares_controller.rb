class ContactSharesController < ApplicationController
  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
      json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contactshareuserid = contact_share.user_id
    if contact_share.delete
      render text: "Contact no longer shared with #{contactshareuserid} "
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
