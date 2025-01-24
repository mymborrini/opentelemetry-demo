package demo.skynet.order_service.orders.repository;

import demo.skynet.order_service.orders.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
