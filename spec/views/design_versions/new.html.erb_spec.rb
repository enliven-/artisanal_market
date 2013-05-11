require 'spec_helper'

describe "design_versions/new" do
  before(:each) do
    assign(:design_version, stub_model(DesignVersion).as_new_record)
  end

  it "renders new design_version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => design_versions_path, :method => "post" do
    end
  end
end
