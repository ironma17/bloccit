require 'rails_helper'
include RandomData



RSpec.describe Comment, type: :model do
  let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
  let(:post) {topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)}
  let(:comment) {Comment.create!(body: 'Comment Body', post: post)}
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }

  describe "attributes" do
    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
    it "should respond to post" do
      expect(comment).to respond_to(:post)
    end
  end

end
