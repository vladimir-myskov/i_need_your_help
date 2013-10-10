class Ticket < ActiveRecord::Base
  include PgSearch

  pg_search_scope :search_by_subject, :against => :subject

  scope :all_query, where("1=1")

  scope :unassigned, where("owner_id IS NULL")
  scope :opened, lambda {
    where("status_id IN (?)", Status.where(:progress => "opened").map { |status| status.id })
  }

  scope :hold, lambda {
    where("status_id IN (?)", Status.where(:progress => "hold").map { |status| status.id })
  }

  scope :closed, lambda {
    where("status_id IN (?)", Status.where(:progress => "closed").map { |status| status.id })
  }



  before_create :generate_token

  attr_accessible :body, :email, :subject, :token, :username

  attr_accessible :department_id, :status_id, :owner_id

  has_one :department
  belongs_to :status
  belongs_to :user
  belongs_to :owner, :class_name => 'User'

  has_many :ticket_actions, :dependent => :destroy

  validates :username, :presence => true
  validates :email, :presence => true
  validates :subject, :presence => true
  validates :body, :presence => true

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def to_param
    token
  end


  def self.select_by_filter(filter)
    case filter
    when "unassigned"
      return unassigned
    when "opened"
      return opened
    when "hold"
      return hold
    when "closed"
      return closed
    end
    return all_query
  end

  protected 

  CHARS = (?A..?Z).to_a
  NUMBERS = (?0..?9).to_a  

  def generate_token
    self.token = loop do
        prefix = 3.times.inject("") {|s, i| s << CHARS[rand(CHARS.size)]}
        sufix = 6.times.inject("") {|s, i| s << NUMBERS[rand(NUMBERS.size)]}
        random_token = "#{prefix}-#{sufix}"
        break random_token unless Ticket.exists?(:token => random_token )
    end
  end

end
