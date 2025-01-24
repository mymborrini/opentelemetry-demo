package demo.skynet.invoice_service.invoices.entity;

import java.math.BigDecimal;
import java.time.ZonedDateTime;

public record Invoice(Long id, ZonedDateTime orderDate, BigDecimal totalAmount) {
}
