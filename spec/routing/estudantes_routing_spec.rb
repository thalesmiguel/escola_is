require "rails_helper"

RSpec.describe EstudantesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/estudantes").to route_to("estudantes#index")
    end

    it "routes to #new" do
      expect(:get => "/estudantes/new").to route_to("estudantes#new")
    end

    it "routes to #show" do
      expect(:get => "/estudantes/1").to route_to("estudantes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/estudantes/1/edit").to route_to("estudantes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/estudantes").to route_to("estudantes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/estudantes/1").to route_to("estudantes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/estudantes/1").to route_to("estudantes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/estudantes/1").to route_to("estudantes#destroy", :id => "1")
    end

  end
end
