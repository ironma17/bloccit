require 'rails_helper'
include RandomData

RSpec.describe SponsoredPost, type: :model do
let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
let(:sponsoredpost) {topic.sponsoredposts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: RandomData.random_number)}

  describe "attributes" do
    it "should respond to title" do
      expect(sponsoredpost).to respond_to(:title)
    end

    it "should respond to body" do
      expect()
    end

    it "should respond to price" do

    end
  end

end
