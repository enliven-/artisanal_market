require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AttributesController do

  # This should return the minimal set of attributes required to create a valid
  # Attribute. As you add validations to Attribute, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "label" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AttributesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all attributes as @attributes" do
      attribute = Attribute.create! valid_attributes
      get :index, {}, valid_session
      assigns(:attributes).should eq([attribute])
    end
  end

  describe "GET show" do
    it "assigns the requested attribute as @attribute" do
      attribute = Attribute.create! valid_attributes
      get :show, {:id => attribute.to_param}, valid_session
      assigns(:attribute).should eq(attribute)
    end
  end

  describe "GET new" do
    it "assigns a new attribute as @attribute" do
      get :new, {}, valid_session
      assigns(:attribute).should be_a_new(Attribute)
    end
  end

  describe "GET edit" do
    it "assigns the requested attribute as @attribute" do
      attribute = Attribute.create! valid_attributes
      get :edit, {:id => attribute.to_param}, valid_session
      assigns(:attribute).should eq(attribute)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Attribute" do
        expect {
          post :create, {:attribute => valid_attributes}, valid_session
        }.to change(Attribute, :count).by(1)
      end

      it "assigns a newly created attribute as @attribute" do
        post :create, {:attribute => valid_attributes}, valid_session
        assigns(:attribute).should be_a(Attribute)
        assigns(:attribute).should be_persisted
      end

      it "redirects to the created attribute" do
        post :create, {:attribute => valid_attributes}, valid_session
        response.should redirect_to(Attribute.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved attribute as @attribute" do
        # Trigger the behavior that occurs when invalid params are submitted
        Attribute.any_instance.stub(:save).and_return(false)
        post :create, {:attribute => { "label" => "invalid value" }}, valid_session
        assigns(:attribute).should be_a_new(Attribute)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Attribute.any_instance.stub(:save).and_return(false)
        post :create, {:attribute => { "label" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested attribute" do
        attribute = Attribute.create! valid_attributes
        # Assuming there are no other attributes in the database, this
        # specifies that the Attribute created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Attribute.any_instance.should_receive(:update_attributes).with({ "label" => "MyString" })
        put :update, {:id => attribute.to_param, :attribute => { "label" => "MyString" }}, valid_session
      end

      it "assigns the requested attribute as @attribute" do
        attribute = Attribute.create! valid_attributes
        put :update, {:id => attribute.to_param, :attribute => valid_attributes}, valid_session
        assigns(:attribute).should eq(attribute)
      end

      it "redirects to the attribute" do
        attribute = Attribute.create! valid_attributes
        put :update, {:id => attribute.to_param, :attribute => valid_attributes}, valid_session
        response.should redirect_to(attribute)
      end
    end

    describe "with invalid params" do
      it "assigns the attribute as @attribute" do
        attribute = Attribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Attribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => attribute.to_param, :attribute => { "label" => "invalid value" }}, valid_session
        assigns(:attribute).should eq(attribute)
      end

      it "re-renders the 'edit' template" do
        attribute = Attribute.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Attribute.any_instance.stub(:save).and_return(false)
        put :update, {:id => attribute.to_param, :attribute => { "label" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested attribute" do
      attribute = Attribute.create! valid_attributes
      expect {
        delete :destroy, {:id => attribute.to_param}, valid_session
      }.to change(Attribute, :count).by(-1)
    end

    it "redirects to the attributes list" do
      attribute = Attribute.create! valid_attributes
      delete :destroy, {:id => attribute.to_param}, valid_session
      response.should redirect_to(attributes_url)
    end
  end

end
