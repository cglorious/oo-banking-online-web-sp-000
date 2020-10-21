class Transfer

  attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    return true if @sender.valid? == true && @receiver.valid? == true && @amount > 0
  end

  def execute_transaction
    if @amount <= @sender.balance && @sender.status == "open" && @receiver.status == "open" && !@status == "complete"
      @sender.balance -= @amount #1000 - 50 = 950
      @receiver.balance += @amount #1000 + 50 = 1050
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status = "complete"
      @receiver.balance -= @amount #1050 - 50 = 1000
      @sender.balance += @amount #950 + 50 = 1000
      @status = "reversed"
    end
  end

end
