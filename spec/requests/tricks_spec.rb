require 'rails_helper'

RSpec.describe "Tricks", type: :request do
  describe "GET /dogs/:dog_id/tricks" do
    let(:dog) { create :dog }
    let!(:tricks) { create_list :trick, 3, dog: dog }

    before { get dog_tricks_path(dog) }

    include_examples "http_status", 200

    it "returns with the tricks in the database" do
      expected_ids = tricks.map { |trick| trick.id }
      actual_ids = json_response.map { |trick| trick['id'] }

      expect(actual_ids).to eq expected_ids
    end
  end


  describe "GET /tricks/:id" do
    before { get trick_path(trick) }

    context "when requested trick is not exist" do
      let(:trick) { build :trick, id: 9999 }

      include_examples "http_status", 404
    end


    context "when requested trick exists" do
      let(:trick) { create :trick }

      include_examples "http_status", 200

      it "returns the requested trick" do
        fields = %w(id name description)

        expect(json_response.slice(*fields)).to eq trick.attributes.slice(*fields)
      end
    end
  end


  describe "POST /dogs/:dog_id/tricks" do
    let(:dog) { create :dog }

    before { post dog_tricks_path(dog), params: {trick: trick_params} }

    context "with invalid params" do
      let(:trick_params) { {invalid: 'params'} }

      include_examples "http_status", 422
    end


    context "with valid params" do
      let(:trick_params) { attributes_for :trick }

      include_examples "http_status", 201

      it "inserts trick into database" do
        expected_fields = trick_params.slice(:name, :description).merge(dog_id: dog.id)
        actual_fields = Trick.last.attributes.slice(*%w(dog_id name description)).symbolize_keys

        expect(actual_fields).to eq expected_fields
      end

      it "returns the newly created trick" do
        fields = %w(id name description)

        expect(json_response.slice(*fields)).to eq Trick.last.attributes.slice(*fields)
      end
    end
  end


  describe "PATCH/PUT /tricks/:id" do
    let!(:trick) { create :trick }

    before { patch trick_path(trick), params: {trick: trick_params} }

    context "with invalid params" do
      let(:trick_params) { {name: ''} }

      include_examples "http_status", 422
    end


    context "with valid params" do
      let(:trick_params) { {name: Faker::Hipster.word} }

      include_examples "http_status", 200

      it "updates specified trick" do
        expect(trick.reload.name).to eq trick_params[:name]
      end

      it "returns with the updated trick" do
        fields = %w(id name description)

        expect(json_response.slice(*fields)).to eq trick.reload.attributes.slice(*fields)
      end
    end
  end


  describe "DELETE /tricks/:id" do
    let!(:trick) { create :trick }

    before { delete trick_path(trick) }

    include_examples "http_status", 204

    it "deletes trick" do
      expect(Trick.pluck(:id)).to_not include(trick.id)
    end
  end
end
