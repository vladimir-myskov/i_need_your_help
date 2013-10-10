class TicketActionsController < ApplicationController
  # POST /ticket_actions
  # POST /ticket_actions.json
  def create
    @ticket_action = TicketAction.new(params[:ticket_action])

    @ticket = @ticket_action.ticket

    @ticket.update_attributes({
      :owner_id=>@ticket_action.owner_id||@ticket.owner_id,
      :status_id=>@ticket_action.status_id||@ticket.status_id
    })

    respond_to do |format|
      if @ticket_action.save
        TicketMailer.ticket_replied @ticket_action
        format.html { redirect_to @ticket, notice: 'Ticket action was successfully created.' }
        format.json { render json: @ticket_action, status: :created, location: @ticket_action }
      else
        format.html { render "tickets/show", :locals => {:ticket => @ticket, :ticket_action => @ticket_action} }
        format.json { render json: @ticket_action.errors, status: :unprocessable_entity }
      end
    end
  end
end
