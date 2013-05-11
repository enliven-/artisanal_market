require 'spec_helper'

describe "design_versions/edit" do
  before(:each) do
    @design_version = assign(:design_version, stub_model(DesignVersion))
  end

  it "renders the edit design_version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => design_versions_path(@design_version), :method => "post" do
    end
  end
end
