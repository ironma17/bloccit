require 'rails_helper'
include RandomData

RSpec.describe QuestionsController, type: :controller do
let(:axe_about_it) {Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [axe_about_it] to @question" do
      get :index
      expect(assigns(:question)).to eq [axe_about_it]
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "GET #create" do
    it "increases the number of questions by 1" do
      expect{post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Question, :count).by(1)
    end
    it "assigns the new question to @question" do
      post :create, question: {title: "test", body: "testing"}
      expect(assigns(:question)).to eq Question.last
    end
    it "redirects to the new question" do
      post :create, question: {title: "testing", body: "test"}
      expect(response).to redirect_to Question.last
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: axe_about_it.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, {id: axe_about_it.id}
      expect(response).to render_template :show
    end
    it "assigns axe_about_it to @question" do
      get :show, {id: axe_about_it.id}
      expect(assigns(:question)).to eq(axe_about_it)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: axe_about_it.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #edit view" do
      get :edit, {id: axe_about_it.id}
      expect(response).to render_template :edit
    end
    it "assigns post to be update to @post" do
      get :edit, {id: axe_about_it.id}
      q_inst = assigns(:question)

      expect(q_inst.id).to eq axe_about_it.id
      expect(q_inst.title).to eq axe_about_it.title
      expect(q_inst.body).to eq axe_about_it.body
    end
  end

  describe "GET #update" do
    it "updates question expected attributes" do
      new_title = "test a"
      new_body = "test A"

      put :update, id: axe_about_it.id, question: {title: new_title, body: new_body}

      updated_question = assigns(:question)
      expect(updated_question.id).to eq axe_about_it.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to the updated question" do
      new_title = "test b"
      new_body = "test B"
      put :update, id: axe_about_it.id, question: {title: new_title, body: new_body}
      expect(response).to redirect_to axe_about_it
    end
  end

  describe "GET #destroy" do
    it "deletes the question" do
      delete :destroy, {id: axe_about_it.id}
      count = Question.where({id: axe_about_it.id}).size
      expect(count).to eq 0
    end
    it "redirects to questions index" do
      delete :destroy, {id: axe_about_it.id}
      expect(response).to redirect_to questions_path
    end
  end
end
