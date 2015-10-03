require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:qestion) {Question.create!(title: 'New Question Title', body: 'New Question Body')}
  let(:answer) {Answer.create!(body: 'Answer Body', question: question)}

  describe "attributes" do
    it "should respond to body" do
      expect(answer).to respond_to(:body)
    end
    it "should respond to question" do
      expect(answer).to respond_to(:question)
    end
  end
end
