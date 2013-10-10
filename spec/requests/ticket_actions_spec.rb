require 'spec_helper'

describe "TicketActions" do
  describe "GET /ticket_actions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get ticket_actions_path
      response.status.should be(200)
    end
  end
end
