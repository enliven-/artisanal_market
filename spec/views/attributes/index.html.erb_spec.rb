require 'spec_helper'

describe "attributes/index" do
  before(:each) do
    assign(:attributes, [
      stub_model(Attribute,
        :label => "Label",
        :attr_img => "Attr Img"
      ),
      stub_model(Attribute,
        :label => "Label",
        :attr_img => "Attr Img"
      )
    ])
  end

  it "renders a list of attributes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Label".to_s, :count => 2
    assert_select "tr>td", :text => "Attr Img".to_s, :count => 2
  end
end
