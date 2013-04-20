require 'spec_helper'

describe "attributes/edit" do
  before(:each) do
    @attribute = assign(:attribute, stub_model(Attribute,
      :label => "MyString",
      :attr_img => "MyString"
    ))
  end

  it "renders the edit attribute form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attributes_path(@attribute), :method => "post" do
      assert_select "input#attribute_label", :name => "attribute[label]"
      assert_select "input#attribute_attr_img", :name => "attribute[attr_img]"
    end
  end
end
