class TicketMailer < ActionMailer::Base
  default from: "from@example.com"

  def ticket_created(ticket)
    @ticket = ticket
    subject = "Ticket created: #{@ticket.subject}"

    result = mail(
      :to => @ticket.email,
      :subject => subject,
      :content_type => 'text/html'
    ) do |format| 
      format.html
    end

    result.deliver
  end

  def ticket_replied(ticket_action)
    @ticket_action = ticket_action
    @ticket = ticket_action.ticket

    subject = "Ticket replied: #{@ticket.subject}"

    result = mail(
      :to => @ticket.email,
      :subject => subject,
      :content_type => 'text/html'
    ) do |format| 
      format.html
    end

    result.deliver

  end
end
