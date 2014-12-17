require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: {title: 'Some title'}
    end

    assert_redirected_to article_path(assigns(:article))
  end
end
