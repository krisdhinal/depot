class CombineItemInCart < ActiveRecord::Migration[7.0]
  def up
    Cart.all.each do |cart|
      # gruping line item dalam cart berdasarkan produk id dan di sum berdasarkan quantity
      sums = cart.line_items.group(:product_id).sum(:quantity)
      # proses looping sums variable dengan kondisi jika quantity nya lebih dari satu
      #  maka line item dalam cart tersebut di buat menjadi uniq dan hanya quantity nya saja yang bertambah
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product_id: product_id).delete_all
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    # memisahkan items dengan quantity > 1 ke multiple item
    LineItem.where("quantity > 1").each do |line_item|
      # tambahkan item individu
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end
      # hapus item original
      line_item.destroy
    end
  end
end
