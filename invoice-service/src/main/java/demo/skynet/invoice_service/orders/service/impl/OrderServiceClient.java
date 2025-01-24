package demo.skynet.invoice_service.orders.service.impl;

import demo.skynet.invoice_service.orders.entity.Order;
import demo.skynet.invoice_service.orders.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@RequiredArgsConstructor
class OrderServiceClient implements OrderService {

  private final RestTemplate restTemplate;

  public Order getOrder(Long orderId){
    return restTemplate.getForObject("/orders/" + orderId, Order.class);
  }


}
