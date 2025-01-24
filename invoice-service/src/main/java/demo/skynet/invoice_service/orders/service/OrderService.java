package demo.skynet.invoice_service.orders.service;

import demo.skynet.invoice_service.orders.entity.Order;

public interface OrderService {

  Order getOrder(Long orderId);
}
