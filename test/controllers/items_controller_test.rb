require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest

  test "index" do
    get "/items.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal Item.count, data.length
  end

  test "create" do
    assert_difference "Item.count", 1 do
      post "/items.json", params: {
        title: "something",
        price: 1,
        description: "something pretty but waste",
        image_url: "image.url",
        brand: "brand name",
        link: "onlineshoplink"}
      
      assert_response 200
    end
  end

  test "show" do
    get "/items/#{Item.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "price", "description", "image_url", "brand", "link", "created_at", "updated_at"], data.keys
  end

  test "update" do
    item = Item.first
    patch "/items/#{item.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Item.count", -1 do
      delete "/items/#{Item.first.id}.json"
      assert_response 200
    end
  end

end
