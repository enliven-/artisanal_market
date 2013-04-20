require 'spec_helper'

describe "attribute_layers/index" do
  before(:each) do
    assign(:attribute_layers, [
      stub_model(AttributeLayer,
        :label => "Label"
      ),
      stub_model(AttributeLayer,
        :label => "Label"
      )
    ])
  end

  it "renders a list of attribute_layers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
  end
end
