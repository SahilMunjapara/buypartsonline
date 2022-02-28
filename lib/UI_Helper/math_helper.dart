double getTotalPrice(int itemPrice, int itemDiscount, int itemQuantity) {
  return (itemPrice - (itemPrice * (itemDiscount / 100))) * itemQuantity;
}

double getPriceWithDiscount(int itemPrice, int itemDiscount) {
  return itemPrice - (itemPrice * (itemDiscount / 100));
}

String getQtyOfferString(int itemQuantity) {
  return 'Buy More ${(5 - itemQuantity).toString()} part to you get 10% Discount';
}
