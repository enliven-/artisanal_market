require 'spec_helper'

describe "attribute_layers/show" do
  before(:each) do
    @attribute_layer = assign(:attribute_layer, stub_model(AttributeLayer,
      :label => "Label"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
  end
end
