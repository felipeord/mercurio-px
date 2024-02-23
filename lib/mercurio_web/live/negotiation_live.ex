defmodule MercurioWeb.NegotiationLive do
  use MercurioWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="w-full">
      <div class="flex items-center gap-4">
        <.link href={~p"/"} class="text-sm font-semibold">
          1 paso
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          2 paso
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          3 paso
        </.link>
        <.link href={~p"/users/log_in"} class="text-sm font-semibold text-mint-12">
          4 paso
        </.link>
      </div>
    </div>
    <div class="max-w-lg mx-auto">
      <.header class="text-center">
        Sign in to account
      </.header>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            Forgot your password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Signing in..." class="w-full">
            Sign in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
