require 'rails_helper'
require 'spec_helper'

class PetsControllerTest
  
  RSpec.describe PetsController, type: :controller do 
    let(:pet) { FactoryGirl.create(:pet) }
    user = login_user

    describe "Index action" do
      before(:each) do
        get :index
      end

      it "tests if current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "returns successfully with 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the index view" do
        expect(response).to render_template(:index)
      end
      it "returns all pets" do
        assigns(:pets).should eq([pet])
      end
    end

        # describe "Show action" do
        #   before(:each) do
        #     get :show, id:pet, user_id:subject.current_user.id
        #   end

        #   it "return 200 status code" do
        #     expect(response).to have_http_status(200)
        #   end
        #   it "Return one pet" do
        #     assigns(:pet).should eq(pet)
        #   end
        # end

    describe "New action" do
      before(:each) do
        get :new, user_id:subject.current_user.id 
      end
      it "tests if current_user" do
        expect(subject.current_user).to_not eq(nil)
      end
      it "returns successfully with 200 status code" do
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
      it "renders the new view" do
       expect(response).to render_template(:new)
      end
    end

    describe "Create action" do
      it "creates a new pet" do
        expect{
          post :create, pet: FactoryGirl.attributes_for(:pet), user_id:subject.current_user.id
        }.to change(Pet,:count).by(1)
      end
      it "redirects to index page" do
        post :create, pet:FactoryGirl.attributes_for(:pet), user_id:subject.current_user.id
        expect(response.location).to match('/pets')
      end
      it "wrong attributes for pet" do
        expect{
          post :create, pet: FactoryGirl.attributes_for(:pet, name: nil, species: "6", age: 6, image:nil), user_id:subject.current_user.id
        }.to_not change(Pet,:count)
      end
    end

    describe 'Update action' do
      context "valid attributes" do
        let(:attr) do 
          {name: "2", species: "Gato", age: 7, image:nil }
        end
        before(:each) do
          put :update, id: pet.id, pet: attr,user_id:subject.current_user.id
          pet.reload
        end
        
        it "redirects to index"  do
          response.should redirect_to(user_pets_path) 
        end
        it "attr name updated"  do
          expect(pet.name).to eql(attr[:name])
        end
        it "attr species updated"  do
          expect(pet.species).to eql(attr[:species])
        end
        it "attr age updated"  do
          expect(pet.age).to eql(attr[:age])
        end
      end
      
      context "invalid attributes" do
        let(:attr) do 
          {name: '6', species: nil, age: 6, image: nil}
        end
        before(:each) do
          put :update, id: pet.id, pet: attr, user_id:subject.current_user.id
          pet.reload
        end

        it "renders edit"  do
          expect(subject).to render_template('pets/edit')
        end
        it "attr species is not updated" do
          expect(pet.species).to_not eql(attr[:species])
        end
      end
    end

    describe 'Delete a pet' do
      it "deletes pet" do
        pet = FactoryGirl.create(:pet)
        expect{
          delete :destroy, id: pet.id, user_id:subject.current_user.id        
        }.to change(Pet,:count).by(-1)
      end
        
      it "redirects to user_pets_path (index)" do
        pet = FactoryGirl.create(:pet)
        delete :destroy, id: pet.id, user_id:subject.current_user.id 
        response.should redirect_to(user_pets_path)
      end
    end

  end
end