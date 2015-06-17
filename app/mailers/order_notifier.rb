class OrderNotifier < ApplicationMailer

	default from: 'Ginius <order@ginius.ru>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
  	@order = order

    @greeting = "Привет, #{@order.profile.first_name}!"

    # emails = [@order.email, 'order@ginius.ru']
    emails = [@order.profile.email]
    mail to: emails, subject: "Ginius: заявка №#{@order.id} принята!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.completed.subject
  #
  def completed
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.in_progress.subject
  #
  def in_progress
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
