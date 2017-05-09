if OrderStatus.count < 4
  OrderStatus.create! [ id: 1, name: "Open" ]
  OrderStatus.create! [ id: 2, name: "Placed" ]
  OrderStatus.create! [ id: 3, name: "Paid" ]
  OrderStatus.create! [ id: 4, name: "Shipped" ]
  OrderStatus.create! [ id: 5, name: "Cancelled" ]
  OrderStatus.create! [ id: 6, name: "Returned" ]
end

