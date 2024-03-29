defmodule MercurioWeb.NegotiationLive do
  use MercurioWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full px-8 py-12 bg-white rounded shadow">
      <h1 class="text-2xl font-bold text-mint-12">
        Módulo de negociación
      </h1>
      <div class="flex items-center gap-6 mt-6">
        <.link
          patch={~p"/negotiation/payment"}
          class={[
            "text-sm font-semibold",
            if(@live_action == :payment, do: "text-mint-11", else: "text-gray-600")
          ]}
        >
          1. Iniciar mandato <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link
          patch={~p"/negotiation/documents"}
          class={[
            "text-sm font-semibold",
            if(@live_action == :documents, do: "text-mint-11", else: "text-gray-600")
          ]}
        >
          2. Documentos <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link
          patch={~p"/negotiation/report"}
          class={[
            "text-sm font-semibold",
            if(@live_action == :report, do: "text-mint-11", else: "text-gray-600")
          ]}
        >
          3. Informe <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link
          patch={~p"/negotiation/viability"}
          class={[
            "text-sm font-semibold",
            if(@live_action == :viability, do: "text-mint-11", else: "text-gray-600")
          ]}
        >
          3. Viabilidad <.icon name="hero-chevron-right-solid" class="w-4 h-4 ml-2" />
        </.link>
        <.link
          patch={~p"/negotiation/meetings"}
          class={[
            "text-sm font-semibold",
            if(@live_action == :meetings, do: "text-mint-11", else: "text-gray-600")
          ]}
        >
          4. Reuniones
        </.link>
      </div>

      <%= if @live_action == :payment do %>
        <div class="max-w-xl mt-8">
          <h2 class="text-xl font-semibold text-mint-12">
            Mandato de negociación
          </h2>
          <p class="mt-2 text-gray-700">
            Hemos realizado una evaluación inicial de su empresa
            y determinamos que el proceso de reestructuración es <span class="font-bold text-mint-11">viable</span>.
          </p>

          <h3 class="mt-4 text-base font-semibold text-mint-12">
            Siguientes pasos
          </h3>

          <p class="mt-2 text-gray-700">
            Una vez realizado /docuel pago en la plataforma Mercurio dará comienzo al proceso formal con las siguientes acciones:
          </p>

          <div class="mt-6 space-y-6">
            <div class="flex flex-col">
              <div class="flex items-center gap-4">
                <div>
                  <.icon name="hero-chevron-double-right-solid" class="w-8 h-8 text-mint-12" />
                </div>
                <p class="text-gray-700">
                  Designación de un negociador experto para liderar el proceso de reestructuración.
                </p>
              </div>
            </div>
            <div class="flex flex-col">
              <div class="flex items-center gap-4">
                <div>
                  <.icon
                    name="hero-chevron-double-right-solid"
                    class="flex-grow w-8 h-8 text-mint-12"
                  />
                </div>

                <p class="text-gray-700">
                  Se emitirá una comunicación por parte de Mercurio a los acreedores para notificarles del proceso en curso y prevenir acciones legales en contra de la empresa.
                </p>
              </div>
            </div>
          </div>

          <p class="mt-4 text-gray-700">
            Por favor realice el pago en el siguiente link para dar inicio formal al proceso.
          </p>
          <a
            class="mt-4 waybox-button"
            href="https://checkout.wompi.co/p/?public-key=pub_test_X0zDA9xoKdePzhd8a0x9HAez7HgGO2fH&currency=COP&amount-in-cents=7890000&reference=37DNKF84S92N1S&signature%3Aintegrity=37c8407747e595535433ef8f6a811d853cd943046624a0ec04662b17bbf33bf5"
          >
            Paga con Wompi
          </a>

          <div class="mt-12">
            <.link
              href={~p"/negotiation/documents"}
              type="submit"
              class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded opacity-20 bg-mint-12"
            >
              Continuar
            </.link>
          </div>
        </div>
      <% end %>

      <%= if @live_action == :documents do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Cargar documentos para diagnóstico
          </h2>

          <p class="mt-6 text-gray-700">
            Para determinar la viabilidad de su empresa habilitamos un <i>cuarto de datos</i>
            seguro para el intercambio de documentos relevantes al proceso.
          </p>

          <p class="mt-6 text-gray-700">
            Una vez dentro de <strong>Datasite</strong> se le solicitarán la siguiente información:
          </p>

          <ul class="flex flex-col gap-2 pl-8 list-disc">
            <li class="text-gray-600">
              Sobreendeudamiento
            </li>
            <li class="text-gray-600">
              Activos adicionales
            </li>
            <li class="text-gray-600">
              Pasivos por retenciones
            </li>
          </ul>
          <div class="flex justify-center px-6 py-10 mt-2 border border-dashed rounded-lg border-gray-900/25">
            <div class="text-center">
              <img src="/images/datasite.svg" class="h-[80px] mx-auto" />

              <div class="flex mt-4 text-sm leading-6 text-gray-600">
                <label
                  for="file-upload"
                  class="relative font-semibold bg-white rounded-md cursor-pointer text-mint-11 focus-within:outline-none focus-within:ring-2 focus-within:ring-mint-11 focus-within:ring-offset-2 hover:text-mint-12"
                >
                  <span>Ir a cargar archivos</span>
                  <input id="file-upload" name="file-upload" type="file" class="sr-only" />
                </label>
                <p class="pl-1 font-medium">en Datasite</p>
              </div>
              <p class="text-xs leading-5 text-gray-600">Sala virtual premium de negocios</p>
            </div>
          </div>

          <form class="flex flex-col gap-6">
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

      <%= if @live_action == :report do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Informe inicial del negociador
          </h2>

          <p class="mt-6 text-gray-700">
            El proceso de reestructuración ha comenzado y hemos designado un negociador a cargo.
          </p>
          <h3 class="mt-4 text-base font-semibold text-mint-12">
            Negociador encargado
          </h3>
          <div class="flex items-center gap-x-6">
            <div class="flex items-center justify-center w-16 h-16 rounded-full bg-mint-2">
              <.icon name="hero-user-solid" class="w-8 h-8 text-mint-11" />
            </div>

            <div>
              <h3 class="text-base font-semibold leading-7 tracking-tight text-gray-900">
                Nicolás Polanía
              </h3>
              <p class="text-sm font-semibold leading-6 text-gray-600">
                Socio / DLA Piper
              </p>
            </div>
          </div>
          <p class="mt-6 text-gray-700">
            El negociador realizará un análisis detallado de la situación de su empresa a partir de los documentos cargados en
            <i>Datasite.</i>
          </p>

          <p class="mt-6 text-gray-700">
            Una vez realizado el informe le será notificado a su correo electrónico y podrá encontrarlo dentro de esta plataforma.
          </p>

          <div class="flex justify-center px-6 py-10 mt-2 border border-dashed rounded-lg border-gray-900/25">
            <div class="text-center">
              <.icon name="hero-document-arrow-down-solid" class="w-16 h-16 text-mint-6" />

              <div class="flex mt-4 text-sm leading-6 text-gray-600">
                <label
                  for="file-upload"
                  class="relative font-semibold bg-white rounded-md cursor-pointer text-mint-11 focus-within:outline-none focus-within:ring-2 focus-within:ring-mint-11 focus-within:ring-offset-2 hover:text-mint-12"
                >
                  <span>Descargar</span>
                </label>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-12">
          <.link
            patch={~p"/negotiation/meetings"}
            class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded bg-mint-12"
          >
            Continuar
          </.link>

          <%!-- Bien --> Link a datasite y pasos a seguir --%>
          <%!-- Mal --> Posibilidad de apelar --%>
        </div>
      <% end %>
      <%= if @live_action == :viability do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Viabilidad de reestructuración
          </h2>
          <p class="mt-6 text-gray-700">
            Nuestro equipo ha finalizado el diagnóstico de su empresa y hemos determinado que es
            <span class="font-semibold text-mint-11">viable para reestructuración</span>
          </p>

          <div class="mt-12">
            <p class="text-gray-600">
              Tenga en cuenta las siguientes recomendaciones para continuar con el proceso de reestructuración.
            </p>
            <div class="mt-6 space-y-6">
              <div class="flex flex-col">
                <div class="flex items-center gap-4">
                  <div class="flex items-center justify-center flex-1 w-10 h-10 p-3 rounded-full bg-mint-12">
                    <.icon name="hero-check-solid" class="w-4 h-4 text-white text-mint-12" />
                  </div>
                  <p class="text-gray-700">
                    Debe ingresar al siguiente
                    <a href="#" class="font-medium text-mint-11 hover:text-mint-12">link</a>
                    para terminar de cargar los documentos financieros solicitados.
                  </p>
                </div>
              </div>
              <div class="flex flex-col">
                <div class="flex items-center gap-4">
                  <div class="flex items-center justify-center flex-1 w-10 h-10 p-3 rounded-full bg-mint-12">
                    <.icon name="hero-check-solid" class="w-4 h-4 text-white text-mint-12" />
                  </div>
                  <p class="text-gray-700">
                    Emitiremos una directiva de <i>stay</i>
                    a los bancos para asegurar la culminación del proceso de reestructuración.
                  </p>
                </div>
              </div>
              <div class="flex flex-col">
                <div class="flex items-center gap-4">
                  <div class="flex items-center justify-center flex-1 w-10 h-10 p-3 rounded-full bg-mint-12">
                    <.icon name="hero-check-solid" class="w-4 h-4 text-white text-mint-12" />
                  </div>
                  <p class="text-gray-700">
                    Puede descargar nuestro
                    <a href="#" class="font-medium text-mint-11 hover:text-mint-12">
                      informe inicial para acreedores
                    </a>
                    con el flujo de caja, indicadores financierose informe de garantías jurídicas.
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mt-12">
          <.link
            patch={~p"/negotiation/meetings"}
            class="inline-flex items-center justify-center h-12 px-4 py-2 text-white rounded bg-mint-12"
          >
            Continuar
          </.link>

          <%!-- Bien --> Link a datasite y pasos a seguir --%>
          <%!-- Mal --> Posibilidad de apelar --%>
        </div>
      <% end %>

      <%= if @live_action == :meetings do %>
        <div class="max-w-xl mt-8 space-y-6 ">
          <h2 class="text-xl font-semibold text-mint-12">
            Sesiones de negociación
          </h2>

          <p class="mt-4 text-gray-700">
            Por favor escoja un bloque de tiempo en las fechas disponibles para realizar la primera sesión de negociación.
          </p>

          <form class="flex flex-col w-full gap-4">
            <div class="flex flex-col w-full max-w-[250px] gap-2">
              <label for="first_date" class="text-base font-medium text-gray-600">
                Fecha primera sesión
              </label>
              <input type="date" multiple class="rounded-md" />
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-700">
                Bloque de tiempo
              </p>
              <div class="flex flex-col gap-4 mt-2">
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">8:00 a.m. - 12:00 p.m.</span>
                </label>
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">12:00 p.m. - 2:00 p.m.</span>
                </label>
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">2:00 p.m. - 4:00 p.m.</span>
                </label>
              </div>
            </div>

            <div class="flex flex-col w-full max-w-[250px] gap-2">
              <label for="first_date" class="text-base font-medium text-gray-600">
                Fecha segunda sesión
              </label>
              <input type="date" multiple class="rounded-md" />
            </div>
            <div>
              <p class="text-sm font-semibold text-gray-700">
                Bloque de tiempo
              </p>
              <div class="flex flex-col gap-4 mt-2">
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">8:00 a.m. - 12:00 p.m.</span>
                </label>
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">12:00 p.m. - 2:00 p.m.</span>
                </label>
                <label class="flex items-center w-full px-2 py-4 border rounded-lg shadow-sm">
                  <input name="first_session_time" type="radio" class="rounded-md" />
                  <span class="ml-2 text-gray-700">2:00 p.m. - 4:00 p.m.</span>
                </label>
              </div>
            </div>
            <div class="mt-6">
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
