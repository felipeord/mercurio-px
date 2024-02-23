defmodule MercurioWeb.NegotiationLive do
  use MercurioWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="w-full px-8 py-12 bg-white rounded shadow">
      <h1 class="text-2xl font-bold text-mint-12">
        Módulo de negociación
      </h1>
      <div class="flex items-center gap-6 mt-6">
        <.link href={~p"/"} class="text-sm font-semibold">
          1 paso <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          2 paso <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          3 paso <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          4 paso
        </.link>
      </div>
      <div class="mt-6 space-y-6">
        <h2 class="text-xl font-semibold text-mint-12">
          Cargar archivos de la negociación
        </h2>
        <form class="flex flex-col gap-4">
          <div class="flex w-full gap-2">
            <div class="flex flex-col gap-2">
              <label for="files" class="text-sm font-semibold text-gray-700">
                Declaración de impuestos del año anterior
              </label>
              <input type="file" multiple />
            </div>
          </div>
          <div>
            <button
              type="submit"
              class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded bg-mint-12"
            >
              Continuar
            </button>
          </div>
        </form>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
