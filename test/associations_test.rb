require 'abstract_unit'
require 'fixtures/product'
require 'fixtures/tariff'
require 'fixtures/product_tariff'

class AssociationTest < Test::Unit::TestCase
  fixtures :products, :tariffs, :product_tariffs

  def setup
    super
    @first_product = products(:first_product)
    @flat = tariffs(:flat)
    @free = tariffs(:free)
    @first_flat = product_tariffs(:first_flat)
  end
  
  def test_setup
    assert_not_nil @first_product
    assert_not_nil @flat
    assert_not_nil @free
    assert_not_nil @first_flat
  end
  
  def test_products
    assert_not_nil @first_product.product_tariffs
    assert_equal 2, @first_product.product_tariffs.length
    assert_not_nil @first_product.tariffs
    assert_equal 2, @first_product.tariffs.length
  end
  
  def test_product_tariffs
    assert_not_nil @first_flat.product
    assert_not_nil @first_flat.tariff
    assert_equal Product, @first_flat.product.class
    assert_equal Tariff, @first_flat.tariff.class
  end
  
  def test_tariffs
    assert_not_nil @flat.product_tariffs
    assert_equal 2, @flat.product_tariffs.length
    assert_not_nil @flat.products
    assert_equal 2, @flat.products.length
  end
end
