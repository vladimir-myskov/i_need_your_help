class TicketAction < ActiveRecord::Base
  default_scope order('created_at ASC')

  belongs_to :ticket
  belongs_to :user
  belongs_to :status
  belongs_to :owner, :class_name => 'User'
  attr_accessible :comment, :status_id, :owner_id, :ticket_id, :user_id

  validates :comment, :presence => true
  validates :ticket, :presence => true
end
