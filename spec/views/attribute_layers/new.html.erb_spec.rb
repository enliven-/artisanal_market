require 'spec_helper'

describe "attribute_layers/new" do
  before(:each) do
    assign(:attribute_layer, stub_model(AttributeLayer,
      :label => "MyString"
    ).as_new_record)
  end

  it "renders new attribute_layer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attribute_layers_path, :method => "post" do
      assert_select "input#attribute_layer_label", :name => "attribute_layer[label]"
    end
  end
end
