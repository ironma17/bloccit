require 'rails_helper'

RSpec.describe RatingsController, type: :controller do
  let(:my_rating) { Rating.create!(severity: "PG") }

  describe "GET #show" do
    it "returns http success" do
      get :show, { id: my_rating.id }
      expect(response).to have_http_status(:success)
    end
  end

end
