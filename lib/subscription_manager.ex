defmodule ColdplayFacts.SubscriptionManager do
  def subscribe(phone = "+" <> full_number) do
    facts = File.stream!("facts.txt")
            |> Enum.map(&String.strip/1)
    Task.start(Factory, :send_facts, [phone, facts, 60])
  end
  def subscribe(phone = "1" <> rest) do
    subscribe("+" <> phone)
  end
  def subscribe(phone) do
    subscribe("+1" <> phone)
  end
end

