require 'spec_helper'

describe "attributes/show" do
  before(:each) do
    @attribute = assign(:attribute, stub_model(Attribute,
      :label => "Label",
      :attr_img => "Attr Img"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Label/)
    rendered.should match(/Attr Img/)
  end
end
