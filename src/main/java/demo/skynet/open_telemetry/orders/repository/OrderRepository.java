package demo.skynet.open_telemetry.orders.repository;

import demo.skynet.open_telemetry.orders.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> {
}
