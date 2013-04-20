require 'spec_helper'

describe "attribute_layers/edit" do
  before(:each) do
    @attribute_layer = assign(:attribute_layer, stub_model(AttributeLayer,
      :label => "MyString"
    ))
  end

  it "renders the edit attribute_layer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attribute_layers_path(@attribute_layer), :method => "post" do
      assert_select "input#attribute_layer_label", :name => "attribute_layer[label]"
    end
  end
end
