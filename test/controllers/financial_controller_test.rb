require 'test_helper'

class FinancialControllerTest < ActionDispatch::IntegrationTest
  test "should get disclosures" do
    get financial_disclosures_url
    assert_response :success
  end

end
