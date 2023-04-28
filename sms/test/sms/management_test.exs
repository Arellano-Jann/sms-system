defmodule Sms.ManagementTest do
  use Sms.DataCase

  alias Sms.Management

  describe "stores" do
    alias Sms.Management.Store

    import Sms.ManagementFixtures

    @invalid_attrs %{identifier: nil, location: nil}

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Management.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Management.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      valid_attrs = %{identifier: 42, location: "some location"}

      assert {:ok, %Store{} = store} = Management.create_store(valid_attrs)
      assert store.identifier == 42
      assert store.location == "some location"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Management.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      update_attrs = %{identifier: 43, location: "some updated location"}

      assert {:ok, %Store{} = store} = Management.update_store(store, update_attrs)
      assert store.identifier == 43
      assert store.location == "some updated location"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Management.update_store(store, @invalid_attrs)
      assert store == Management.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Management.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Management.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Management.change_store(store)
    end
  end
end
