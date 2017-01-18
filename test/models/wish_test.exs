defmodule Shopql.WishTest do
  use Shopql.ModelCase

  alias Shopql.Wish

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Wish.changeset(%Wish{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Wish.changeset(%Wish{}, @invalid_attrs)
    refute changeset.valid?
  end
end
