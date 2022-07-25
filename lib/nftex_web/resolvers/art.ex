defmodule NftexWeb.Resolvers.Art do
  def get(%{id: art_id}, _context), do: Nftex.get_art(art_id)
  def create(%{input: params}, _context), do: Nftex.create_art(params)
end
