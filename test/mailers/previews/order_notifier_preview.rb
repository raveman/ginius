# Preview all emails at http://localhost:3000/rails/mailers/order_notifier
class OrderNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/received
  def received
    OrderNotifier.received
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/completed
  def completed
    OrderNotifier.completed
  end

  # Preview this email at http://localhost:3000/rails/mailers/order_notifier/in_progress
  def in_progress
    OrderNotifier.in_progress
  end

end
