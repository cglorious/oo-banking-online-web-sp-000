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
    if @amount <= @sender.balance && @sender.valid? && @receiver.valid? && !(@status == "complete")
      @sender.balance -= @amount
      @receiver.balance += @amount
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
    else
      nil
    end
  end

end
