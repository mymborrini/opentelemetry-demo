package demo.skynet.open_telemetry.orders.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

@Entity
@Getter
@NoArgsConstructor
@Table(name = "orders")
public class Order {

  @Id
  Long id;
  Long customerId;
  ZonedDateTime orderDate;
  BigDecimal totalAmount;

}
