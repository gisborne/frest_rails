require 'rails_helper'

RSpec.describe "Namespaces", type: :request do
  describe "GET /namespaces" do
    it "works! (now write some real specs)" do
      get namespaces_path
      expect(response).to have_http_status(200)
    end
  end
end
