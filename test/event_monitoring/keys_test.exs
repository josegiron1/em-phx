defmodule EventMonitoring.KeysTest do
  use EventMonitoring.DataCase

  alias EventMonitoring.Keys

  describe "keys" do
    alias EventMonitoring.Keys.Key

    import EventMonitoring.KeysFixtures

    @invalid_attrs %{id: nil, private: nil, public: nil, event_id: nil}

    test "list_keys/0 returns all keys" do
      key = key_fixture()
      assert Keys.list_keys() == [key]
    end

    test "get_key!/1 returns the key with given id" do
      key = key_fixture()
      assert Keys.get_key!(key.id) == key
    end

    test "create_key/1 with valid data creates a key" do
      valid_attrs = %{id: 42, private: "some private", public: "some public", event_id: 42}

      assert {:ok, %Key{} = key} = Keys.create_key(valid_attrs)
      assert key.id == 42
      assert key.private == "some private"
      assert key.public == "some public"
      assert key.event_id == 42
    end

    test "create_key/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Keys.create_key(@invalid_attrs)
    end

    test "update_key/2 with valid data updates the key" do
      key = key_fixture()
      update_attrs = %{id: 43, private: "some updated private", public: "some updated public", event_id: 43}

      assert {:ok, %Key{} = key} = Keys.update_key(key, update_attrs)
      assert key.id == 43
      assert key.private == "some updated private"
      assert key.public == "some updated public"
      assert key.event_id == 43
    end

    test "update_key/2 with invalid data returns error changeset" do
      key = key_fixture()
      assert {:error, %Ecto.Changeset{}} = Keys.update_key(key, @invalid_attrs)
      assert key == Keys.get_key!(key.id)
    end

    test "delete_key/1 deletes the key" do
      key = key_fixture()
      assert {:ok, %Key{}} = Keys.delete_key(key)
      assert_raise Ecto.NoResultsError, fn -> Keys.get_key!(key.id) end
    end

    test "change_key/1 returns a key changeset" do
      key = key_fixture()
      assert %Ecto.Changeset{} = Keys.change_key(key)
    end
  end
end
