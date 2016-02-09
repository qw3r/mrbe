require 'rails_helper'

RSpec.describe "Dogs", type: :request do
  let(:visitor) { create :user, :admin }

  before { set_authenticated_user visitor }

  describe "GET /dogs" do
    let!(:dogs) { create_list :dog, 3 }

    before { get dogs_path }

    include_examples "http_status", 200

    it "returns with the dogs in the database" do
      expected_ids = dogs.map { |dog| dog.id }
      actual_ids = json_response.map { |dog| dog['id'] }

      expect(actual_ids).to eq expected_ids
    end
  end


  describe "GET /dogs/:id" do
    before { get dog_path(dog) }

    context "when requested dog is not exist" do
      let(:dog) { build :dog, id: 9999 }

      include_examples "http_status", 404
    end


    context "when requested dog exists" do
      let(:dog) { create :dog }

      include_examples "http_status", 200

      it "returns the requested dog" do
        fields = %w(id name breed)

        expect(json_response.slice(*fields)).to eq dog.attributes.slice(*fields)
      end
    end
  end


  describe "POST /dogs" do
    before { post dogs_path, params: {dog: dog_params} }

    context "with invalid params" do
      let(:dog_params) { {invalid: 'params'} }

      include_examples "http_status", 422
    end


    context "with valid params" do
      let(:dog_params) { attributes_for :dog }

      include_examples "http_status", 201

      it "inserts dog into database" do
        expected_fields = dog_params.slice(:name, :breed)
        actual_fields = Dog.last.attributes.slice(*%w(name breed)).symbolize_keys

        expect(actual_fields).to eq expected_fields
      end

      it "sets the authenticated user as the dog's owner" do
        expect(Dog.last.user).to eq visitor
      end

      it "returns the newly created dog" do
        fields = %w(id name breed)

        expect(json_response.slice(*fields)).to eq Dog.last.attributes.slice(*fields)
      end
    end
  end


  describe "PATCH/PUT /dogs/:id" do
    let!(:dog) { create :dog }

    before { patch dog_path(dog), params: {dog: dog_params} }

    context "with invalid params" do
      let(:dog_params) { {name: ''} }

      include_examples "http_status", 422
    end


    context "with valid params" do
      let(:dog_params) { {name: Faker::Hipster.word} }

      include_examples "http_status", 200

      it "updates specified dog" do
        expect(dog.reload.name).to eq dog_params[:name]
      end

      it "returns with the updated dog" do
        fields = %w(id name breed)

        expect(json_response.slice(*fields)).to eq dog.reload.attributes.slice(*fields)
      end
    end
  end


  describe "DELETE /dogs/:id" do
    let!(:dog) { create :dog }

    before { delete dog_path(dog) }

    include_examples "http_status", 204

    it "deletes dog" do
      expect(Dog.pluck(:id)).to_not include(dog.id)
    end
  end
end
