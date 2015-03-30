require 'rails_helper'

RSpec.describe "namespaces/index", type: :view do
  before(:each) do
    assign(:namespaces, [
      Namespace.create!(
        :name => "Name",
        :namespace => nil
      ),
      Namespace.create!(
        :name => "Name",
        :namespace => nil
      )
    ])
  end

  it "renders a list of namespaces" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
