package demo.skynet.open_telemetry.orders.entity;

import lombok.extern.java.Log;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

public record Order(Long id, Long customerId, ZonedDateTime orderDate, BigDecimal totalAmount) {

}
