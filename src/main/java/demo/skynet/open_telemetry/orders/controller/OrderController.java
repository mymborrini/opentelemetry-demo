package demo.skynet.open_telemetry.orders.controller;


import demo.skynet.open_telemetry.orders.entity.Order;
import demo.skynet.open_telemetry.orders.repository.OrderRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

@RestController
@RequestMapping("/orders")
public class OrderController {

  private final OrderRepository orderRepository;

  public OrderController(OrderRepository orderRepository) {
    this.orderRepository = orderRepository;
  }


  @GetMapping("/{id}")
  public Order findById(@PathVariable Long id) {
    return orderRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid id: %d".formatted(id)));
  }

}
