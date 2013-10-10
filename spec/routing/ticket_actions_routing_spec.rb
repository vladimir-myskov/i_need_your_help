require "spec_helper"

describe TicketActionsController do
  describe "routing" do

    it "routes to #index" do
      get("/ticket_actions").should route_to("ticket_actions#index")
    end

    it "routes to #new" do
      get("/ticket_actions/new").should route_to("ticket_actions#new")
    end

    it "routes to #show" do
      get("/ticket_actions/1").should route_to("ticket_actions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ticket_actions/1/edit").should route_to("ticket_actions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ticket_actions").should route_to("ticket_actions#create")
    end

    it "routes to #update" do
      put("/ticket_actions/1").should route_to("ticket_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ticket_actions/1").should route_to("ticket_actions#destroy", :id => "1")
    end

  end
end
