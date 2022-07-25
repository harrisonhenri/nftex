defmodule Nftex do
  alias Nftex.Arts.Create, as: CreateArt
  alias Nftex.Arts.Get, as: GetArt

  defdelegate create_art(params), to: CreateArt, as: :call
  defdelegate get_art(params), to: GetArt, as: :call
end
