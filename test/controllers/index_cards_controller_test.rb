require 'test_helper'

class IndexCardsControllerTest < ActionController::TestCase
  setup do
    @index_card = index_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:index_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create index_card" do
    assert_difference('IndexCard.count') do
      post :create, index_card: { architect: @index_card.architect, building_name: @index_card.building_name, content: @index_card.content, creditline: @index_card.creditline, filename: @index_card.filename, flickr_id: @index_card.flickr_id, inventory_date: @index_card.inventory_date, no_of_photos: @index_card.no_of_photos, original_filename: @index_card.original_filename, pathalias: @index_card.pathalias, photographer: @index_card.photographer, place: @index_card.place, systematic: @index_card.systematic, title: @index_card.title, url_m: @index_card.url_m, url_o: @index_card.url_o, url_s: @index_card.url_s, url_sq: @index_card.url_sq, url_t: @index_card.url_t, year_taken: @index_card.year_taken }
    end

    assert_redirected_to index_card_path(assigns(:index_card))
  end

  test "should show index_card" do
    get :show, id: @index_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @index_card
    assert_response :success
  end

  test "should update index_card" do
    patch :update, id: @index_card, index_card: { architect: @index_card.architect, building_name: @index_card.building_name, content: @index_card.content, creditline: @index_card.creditline, filename: @index_card.filename, flickr_id: @index_card.flickr_id, inventory_date: @index_card.inventory_date, no_of_photos: @index_card.no_of_photos, original_filename: @index_card.original_filename, pathalias: @index_card.pathalias, photographer: @index_card.photographer, place: @index_card.place, systematic: @index_card.systematic, title: @index_card.title, url_m: @index_card.url_m, url_o: @index_card.url_o, url_s: @index_card.url_s, url_sq: @index_card.url_sq, url_t: @index_card.url_t, year_taken: @index_card.year_taken }
    assert_redirected_to index_card_path(assigns(:index_card))
  end

  test "should destroy index_card" do
    assert_difference('IndexCard.count', -1) do
      delete :destroy, id: @index_card
    end

    assert_redirected_to index_cards_path
  end
end
