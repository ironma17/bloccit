require 'rails_helper'
include RandomData

RSpec.describe Label, type: :model do
  let(:topic) { create(:topic) }
  let(:post) { create(:post) }
  let(:user) { create(:user) }
  let(:my_label) { create(:label) }
  let(:my_2ndlabel) { Label.create!(name: RandomData.random_name) }

  it { should belong_to :labelable }
  it { should have_many :labelings }
  it { should have_many :topics }
  it { should have_many :posts }

  describe "labelable" do
    it "allows the same label to be associated with a different topic and post" do
      topic.labels << my_label
      post.labels << my_label

      topic_label = topic.labels[0]
      post_label = post.labels[0]
      expect(topic_label).to eql(post_label)
    end
  end

  describe ".update_labels" do
    it "takes a comma delimited string and returns an array of Labels" do
      labelz = "#{my_label.name}, #{my_2ndlabel.name}"
      labels_as_a = [my_label, my_2ndlabel]
      expect(Label.update_labels(labelz)).to eq(labels_as_a)
    end
  end
end
