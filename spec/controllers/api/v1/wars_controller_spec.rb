require 'spec_helper'

describe Api::V1::WarsController, :type => :request do
  render_views

  let!(:user) { FactoryGirl.create(:user) }
  let!(:war)  { FactoryGirl.create(:war)  }
  let!(:new_war) {
    {
      :name              => "Horse",
      :is_private        => false,
      :open_registration => false,
      :ending_score      => 10,
      :booty             => "$10",
      :owner_id          => user.id
    }
  }

  context "#show" do

    it "returns 200 status when war is found" do
      get :show, :id => war.id, :user_id => user.id
      expect(response.status).to eq(200)
      puts @war
    end
  end

  context "#create" do

    before { post :create, :user_id => user.id, :war => new_war }

    it "returns a 201 status when a war is created" do
      expect(response.status).to eq(201)
    end
  end

  context "#update" do

    before { put :update, :user_id => user.id, :war_id => war.id, { :war => { :name => "Updated War" } } }

    it "updated the name on war update" do
      expect(response.status.to eq(200)
    end

  end

end
