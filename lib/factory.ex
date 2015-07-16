defmodule Factory do
  require Logger

  def send_facts(recipient, [], _) do
    ExTwilio.Message.create([to: recipient, from: "+16468464435", body: "That concludes Coldplay Facts. Thank you for subscribing. You have now been unsubscribed."])
  end
  def send_facts(recipient, [next_fact|rest], median_wait) do
    Logger.debug "Sending '#{next_fact}' to #{recipient}..."
    {:ok, message} = ExTwilio.Message.create([to: recipient, from: "+16468464435", body: next_fact])
    if (message.error_code |> should_continue? == :yes) do
      :timer.sleep(wait_time_in_milliseconds(median_wait))
      send_facts(recipient, rest, median_wait)
    else
      Logger.warn "We encountered an error #{inspect message}"
    end
  end

  defp wait_time_in_milliseconds(median_wait) do
    (median_wait * 1_000) + :random.uniform(6_000) - 3_000
  end

  defp should_continue?(nil), do: :yes
  defp should_continue?(30001), do: :yes
  defp should_continue?(30002), do: :no
  defp should_continue?(30003), do: :no
  defp should_continue?(30004), do: :no
  defp should_continue?(30005), do: :no
  defp should_continue?(30006), do: :no
  defp should_continue?(30007), do: :no
  defp should_continue?(30008), do: :yes

end
