require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bulletin = bulletins :one
  end

  test 'should get index' do
    get bulletins_url
    assert_response :success
    assert_select 'h4', @bulletin.title
  end

  test 'should show bulletin' do
    get bulletin_url(@bulletin)
    assert_response :success
    assert_select 'h1', @bulletin.title
  end
end
