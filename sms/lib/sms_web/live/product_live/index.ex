defmodule SmsWeb.ProductLive.Index do
  use SmsWeb, :live_view

  alias Sms.Items
  alias Sms.Items.Product

  # includes
  alias Sms.Management
  alias Sms.Management.Store

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :products, Items.list_products())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Product")
    |> assign(:product, Items.get_product!(id))
    |> assign(:stores, Management.list_stores()) # lists all stores
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Product")
    |> assign(:product, %Product{})
    |> assign(:stores, Management.list_stores()) # lists all stores
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Products")
    |> assign(:product, nil)
  end

  @impl true
  def handle_info({SmsWeb.ProductLive.FormComponent, {:saved, product}}, socket) do
    {:noreply, stream_insert(socket, :products, product |> Repo.preload(:store, force: true))} # preloads the store
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    product = Items.get_product!(id)
    {:ok, _} = Items.delete_product(product)

    {:noreply, stream_delete(socket, :products, product)}
  end
end
