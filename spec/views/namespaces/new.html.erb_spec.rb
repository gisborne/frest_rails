require 'rails_helper'

RSpec.describe "namespaces/new", type: :view do
  before(:each) do
    assign(:namespace, Namespace.new(
      :name => "MyString"
    ))
  end

  it "renders new namespace form" do
    render

    assert_select "form[action=?][method=?]", namespaces_path, "post"
  end
end
