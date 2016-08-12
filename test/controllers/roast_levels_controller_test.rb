require 'test_helper'

class RoastLevelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @roast_level = roast_levels(:one)
  end

  test "should get index" do
    get roast_levels_url
    assert_response :success
  end

  test "should get new" do
    get new_roast_level_url
    assert_response :success
  end

  test "should create roast_level" do
    assert_difference('RoastLevel.count') do
      post roast_levels_url, params: { roast_level: { name: @roast_level.name } }
    end

    assert_redirected_to roast_level_url(RoastLevel.last)
  end

  test "should show roast_level" do
    get roast_level_url(@roast_level)
    assert_response :success
  end

  test "should get edit" do
    get edit_roast_level_url(@roast_level)
    assert_response :success
  end

  test "should update roast_level" do
    patch roast_level_url(@roast_level), params: { roast_level: { name: @roast_level.name } }
    assert_redirected_to roast_level_url(@roast_level)
  end

  test "should destroy roast_level" do
    assert_difference('RoastLevel.count', -1) do
      delete roast_level_url(@roast_level)
    end

    assert_redirected_to roast_levels_url
  end
end
