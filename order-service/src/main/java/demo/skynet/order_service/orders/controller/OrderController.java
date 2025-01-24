package demo.skynet.order_service.orders.controller;


import demo.skynet.order_service.orders.entity.Order;
import demo.skynet.order_service.orders.repository.OrderRepository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
