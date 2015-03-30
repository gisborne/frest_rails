require 'rails_helper'

RSpec.describe "namespaces/new", type: :view do
  before(:each) do
    assign(:namespace, Namespace.new(
      :name => "MyString",
      :namespace => nil
    ))
  end

  it "renders new namespace form" do
    render

    assert_select "form[action=?][method=?]", namespaces_path, "post" do

      assert_select "input#namespace_name[name=?]", "namespace[name]"

      assert_select "input#namespace_namespace_id[name=?]", "namespace[namespace_id]"
    end
  end
end
