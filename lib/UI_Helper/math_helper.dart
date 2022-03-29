double getTotalPrice(int itemPrice, int itemDiscount, int itemQuantity) {
  return (itemPrice - (itemPrice * (itemDiscount / 100))) * itemQuantity;
}

double getPriceWithDiscount(int itemPrice, int itemDiscount) {
  return itemPrice - (itemPrice * (itemDiscount / 100));
}

String getQtyOfferString(int itemQuantity, int itemMoq, int itemDiscount) {
  return 'Buy More ${(itemMoq - itemQuantity).toString()} part to you get $itemDiscount% Discount';
}
