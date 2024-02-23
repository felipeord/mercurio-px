defmodule MercurioWeb.NegotiationLive do
  use MercurioWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="w-full px-8 py-12 bg-white rounded shadow">
      <h1 class="text-2xl font-bold text-mint-12">
        Módulo de negociación
      </h1>
      <div class="flex items-center gap-6 mt-6">
        <.link patch={~p"/negotiation/payment"} class="text-sm font-semibold">
          1. Pagar <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link patch={~p"/negotiation/documents"} class="text-sm font-semibold text-mint-12">
          2. Documentos <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link patch={~p"/negotiation/viability"} class="text-sm font-semibold text-mint-12">
          3. Viabilidad <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link patch={~p"/negotiation/meetings"} class="text-sm font-semibold text-mint-12">
          4. Negociaciones
        </.link>
      </div>

      <%= if @live_action == :payment do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Realice su pago en Wompi
          </h2>
          <p class="mt-4 text-gray-700">
            En el siguiente link podrás realizar el pago para continuar con el proceso de negociación.
          </p>

          <form class="flex flex-col gap-6">
            <div class="flex w-full gap-2">
              <div class="flex flex-col gap-2">
                <label for="files" class="text-sm font-semibold text-gray-700">
                  Declaración de impuestos del año anterior
                </label>
                <input type="file" multiple />
              </div>
            </div>
            <div>
              <.link
                href={~p"/negotiation/documents"}
                type="submit"
                class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded bg-mint-12"
              >
                Continuar
              </.link>
            </div>
          </form>
        </div>
      <% end %>

      <%= if @live_action == :documents do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Cargar documentos para diagnóstico
          </h2>
          <form class="flex flex-col gap-6">
            <div class="flex flex-col gap-2">
              <label for="files" class="text-sm font-semibold text-gray-700">
                Declaración de impuestos*
              </label>
              <input type="file" />
            </div>
            <div class="flex flex-col gap-2">
              <label for="files" class="text-sm font-semibold text-gray-700">
                Anexo 2*
              </label>
              <input type="file" />
            </div>
            <div class="flex flex-col gap-2">
              <label for="files" class="text-sm font-semibold text-gray-700">
                Anexo 3*
              </label>
              <input type="file" />
            </div>
            <div class="flex flex-col gap-2">
              <label for="files" class="text-sm font-semibold text-gray-700">
                Anexo 4*
              </label>
              <input type="file" />
            </div>

            <div>
              <.link
                patch={~p"/negotiation/viability"}
                class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded bg-mint-12"
              >
                Continuar
              </.link>
            </div>
          </form>
        </div>
      <% end %>

      <%= if @live_action == :viability do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Viabilidad de reestructuración
          </h2>
          <p class="mt-6 text-gray-600">
            Nuestro equipo ha finalizado el diagnóstico de su empresa y hemos determinado que es <span class="font-semibold text-mint-11">viable para reestructuración</span>.
          </p>

          <ul></ul>

          <%!-- Bien --> Link a datasite y pasos a seguir --%>
          <%!-- Mal --> Posibilidad de apelar --%>
        </div>
      <% end %>

      <%= if @live_action == :meetings do %>
        <div class="max-w-xl mt-8 space-y-6 ">
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
      <% end %>
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_, _, socket) do
    {:noreply, socket}
  end
end
