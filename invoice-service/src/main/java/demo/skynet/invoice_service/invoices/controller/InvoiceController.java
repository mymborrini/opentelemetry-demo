package demo.skynet.invoice_service.invoices.controller;


import demo.skynet.invoice_service.invoices.entity.Invoice;
import demo.skynet.invoice_service.orders.entity.Order;
import demo.skynet.invoice_service.orders.service.OrderService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/invoices")
@RequiredArgsConstructor
@Slf4j
public class InvoiceController {

  private final OrderService orderService;

  @GetMapping(value = "/{id}")
  public Invoice getInvoice(@PathVariable Long id) {
    Order order = orderService.getOrder(id);
    log.info("Invoice saved");
    return new Invoice(id, order.orderDate(), order.totalAmount());
  }

  @ExceptionHandler(value = { RuntimeException.class })
  protected ResponseEntity<String> handleException(RuntimeException e) {
    log.error(e.getMessage(),e);
    return ResponseEntity.internalServerError().body(e.getMessage());
  }

}
