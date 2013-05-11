require 'spec_helper'

describe "design_versions/index" do
  before(:each) do
    assign(:design_versions, [
      stub_model(DesignVersion),
      stub_model(DesignVersion)
    ])
  end

  it "renders a list of design_versions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
