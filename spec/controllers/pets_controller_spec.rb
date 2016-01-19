require 'rails_helper'
require 'spec_helper'

class PetsControllerTest
  
  RSpec.describe PetsController, type: :controller do 
    let(:pet) { FactoryGirl.create(:pet) }
    user = login_user

    describe "pets#index" do
      before(:each) do
        get :index
      end

      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "should successfully: HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "renders the index template" do
        expect(response).to render_template(:index)
      end
      it "gets all pets" do
        assigns(:pets).should eq([pet])
      end
    end

    describe "pets#show" do
      before(:each) do
        get :show, id:pet, user_id:subject.current_user.id
      end

      it "successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end
      it "get one pet" do
        assigns(:pet).should eq(pet)
      end
    end

    describe "pets#new" do
      before(:each) do
        get :new, user_id:subject.current_user.id 
      end
      it "should have a current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "successfully with an HTTP 200 status code" do
        expect(response).to have_http_status(200)
      end

      it "renders the :new view" do
       expect(response).to render_template(:new)
      end
    end

    describe "POST #create" do
      context "with valid attributes" do
          it "creates a new pet" do
            expect{
              post :create, pet: FactoryGirl.attributes_for(:pet), user_id:subject.current_user.id
            }.to change(Pet,:count).by(1)
          end
          it "redirects to index page" do
            post :create, pet:FactoryGirl.attributes_for(:pet), user_id:subject.current_user.id
            expect(response.location).to match('/pets')
          end
      end
      
      context "with invalid attributes" do
        it "does not save the new pet" do
          expect{
            post :create, pet: FactoryGirl.attributes_for(:pet, name: nil, species: "6", age: 6, image:nil), user_id:subject.current_user.id
          }.to_not change(Pet,:count)
        end
      end 
    end

    describe 'pets#update' do
      context "valid attributes" do
        let(:attr) do 
          {name: "3", species: "6", age: 6, image:nil }
        end
        before(:each) do
          put :update, id: pet.id, pet: attr
          pet.reload
        end
        
        it "redirects to /pets"  do
          response.should redirect_to(:pets) 
        end
        it "attr name updated"  do
          expect(pet.name).to eql(attr[:name])
        end
      end
      
      context "invalid attributes" do
        let(:attr) do 
          {name: '6', species: nil, age: nil }
        end
        before(:each) do
          put :update, id: pet.id, pet: attr
          pet.reload
        end

        it "renders /edit"  do
          expect(subject).to render_template("pets/edit")
        end
        it "attr species is not updated"  do
          expect(pet.race).to_not eql(attr[:race])
        end
      end

    end

=begin
  
require "rails_helper"
​
RSpec.describe PetsController, type: :routing do
  describe "routing API" do
​
    it "routes to API pets" do
      expect(:get => "/api/pets/1").to route_to("pets#pet", :id => "1")
    end
​
    it "routes to API owner" do
      expect(:get => "/api/owner/1").to route_to("pets#owner", :id => "1")
    end
​
    it "routes to API image" do
      expect(:get => "/api/image/1").to route_to("pets#image", :id => "1")
    end
  end
end  
=end

    describe 'DELETE destroy' do
      before :each do
        
      end

      it "deletes pet" do
        pet = FactoryGirl.create(:pet)
        expect{
          delete :destroy, id: pet.id        
        }.to change(Pet,:count).by(-1)
      end
        
      it "redirects to user_pets_path (index)" do
        pet = FactoryGirl.create(:pet)
        delete :destroy, id: pet.id 
        response.should redirect_to(:index)
      end
    end

  end
end