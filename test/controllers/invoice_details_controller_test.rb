require 'test_helper'

class InvoiceDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invoice_detail = invoice_details(:one)
  end

  test "should get index" do
    get invoice_details_url
    assert_response :success
  end

  test "should get new" do
    get new_invoice_detail_url
    assert_response :success
  end

  test "should create invoice_detail" do
    assert_difference('InvoiceDetail.count') do
      post invoice_details_url, params: { invoice_detail: { finalized_at: @invoice_detail.finalized_at, indications: @invoice_detail.indications, invoice_id: @invoice_detail.invoice_id, ordered_at: @invoice_detail.ordered_at, product: @invoice_detail.product, qt_ordered: @invoice_detail.qt_ordered, qt_served: @invoice_detail.qt_served, total_price: @invoice_detail.total_price, total_tax: @invoice_detail.total_tax, unitary_price: @invoice_detail.unitary_price } }
    end

    assert_redirected_to invoice_detail_url(InvoiceDetail.last)
  end

  test "should show invoice_detail" do
    get invoice_detail_url(@invoice_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_invoice_detail_url(@invoice_detail)
    assert_response :success
  end

  test "should update invoice_detail" do
    patch invoice_detail_url(@invoice_detail), params: { invoice_detail: { finalized_at: @invoice_detail.finalized_at, indications: @invoice_detail.indications, invoice_id: @invoice_detail.invoice_id, ordered_at: @invoice_detail.ordered_at, product: @invoice_detail.product, qt_ordered: @invoice_detail.qt_ordered, qt_served: @invoice_detail.qt_served, total_price: @invoice_detail.total_price, total_tax: @invoice_detail.total_tax, unitary_price: @invoice_detail.unitary_price } }
    assert_redirected_to invoice_detail_url(@invoice_detail)
  end

  test "should destroy invoice_detail" do
    assert_difference('InvoiceDetail.count', -1) do
      delete invoice_detail_url(@invoice_detail)
    end

    assert_redirected_to invoice_details_url
  end
end
