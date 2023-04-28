defmodule Sms.ItemsTest do
  use Sms.DataCase

  alias Sms.Items

  describe "products" do
    alias Sms.Items.Product

    import Sms.ItemsFixtures

    @invalid_attrs %{count: nil, name: nil, retail: nil, vendor_name: nil, wholesale_price: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Items.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Items.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{count: 42, name: "some name", retail: 120.5, vendor_name: "some vendor_name", wholesale_price: 120.5}

      assert {:ok, %Product{} = product} = Items.create_product(valid_attrs)
      assert product.count == 42
      assert product.name == "some name"
      assert product.retail == 120.5
      assert product.vendor_name == "some vendor_name"
      assert product.wholesale_price == 120.5
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{count: 43, name: "some updated name", retail: 456.7, vendor_name: "some updated vendor_name", wholesale_price: 456.7}

      assert {:ok, %Product{} = product} = Items.update_product(product, update_attrs)
      assert product.count == 43
      assert product.name == "some updated name"
      assert product.retail == 456.7
      assert product.vendor_name == "some updated vendor_name"
      assert product.wholesale_price == 456.7
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_product(product, @invalid_attrs)
      assert product == Items.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Items.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Items.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Items.change_product(product)
    end
  end
end
